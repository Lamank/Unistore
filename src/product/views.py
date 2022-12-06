from itertools import product
from django.views.generic import DetailView, ListView
from django.shortcuts import redirect
from django.http import JsonResponse
from django.views.generic.edit import FormMixin
from product.models import Category, Product, ProductReview, Media
from product.services.products import (
    get_specific_product,
    get_reviews,
    product_list, 
    similar_product, 
    get_specific_product_medias, 
    get_product_tag, 
    get_product_categories, 
    get_product_brand, 
    get_product_screen_size,
    get_campaigns)

from product.forms import ProductReviewForm
from django.db.models import Max
from typing import Dict, Any
from product.models import Product

class ProductListView(ListView):
    # paginate_by = 18
    model = Product
    template_name = "product/product_list.html"
    queryset = product_list()

    def get_context_data(self, **kwargs: Any) -> Dict[str, Any]:
        context = super().get_context_data(**kwargs)
        context['categories'] = get_product_categories()
        context['tags'] = get_product_tag()
        context['manufacturers'] = get_product_brand()
        context['sizes'] = get_product_screen_size().exclude(size = None)
        context["campaign"] = get_campaigns().filter(id=2).first()
        context['max'] = self.queryset.aggregate(Max("price"))

        return context


class ProductDetailView(FormMixin, DetailView):

    model = Product
    form_class = ProductReviewForm

    def get_context_data(self, **kwargs) -> dict:
        context = super(ProductDetailView, self).get_context_data(**kwargs)

        # Query is sent to the database
        product = get_specific_product(slug=self.kwargs.get('slug'))
        medias = get_specific_product_medias(product.id)
        media_length = len(medias) + 1
        product_reviews = get_reviews(product_id=product.id)
        similar_products = similar_product(product=product)
        # QUERIES

        context["medias"] = medias 
        context["media_length"] = media_length
        context["reviews"] = product_reviews
        context["similar_products"] = similar_products
        context["product"] = product
        context["campaign"] = get_campaigns().filter(id=2).first()
        print(context["campaign"] )
        # Form
        context['form'] = ProductReviewForm(initial={'product': self.object})
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        form = self.get_form()
        if request.user.is_authenticated:
            if form.is_valid():
                parent_obj = None
                try:    
                    parent_id = int(request.POST.get('parent_id'))
                except:
                    parent_id = None

                if parent_id:
                    parent_qs = ProductReview.objects.filter(id=parent_id)
                    if parent_qs.exists() and parent_qs.count() == 1:
                        parent_obj = parent_qs.first()
                
                review = form.save(commit=False)
                review.author = request.user
                review.product = get_specific_product(slug=self.kwargs.get('slug'))
                review.parent = parent_obj
                form = self.get_form()
                review.save()


                return redirect("product:product-detail", slug=self.kwargs.get('slug'))

            else:
                return self.form_invalid(form)
        else:
            return redirect("/users/user-login")

    def form_valid(self, form):
        form.save()
        return super(ProductDetailView, self).form_valid(form)
