# add the , and then url to the urls.py
from django.conf.urls import include, url


# Add the following

urlpatterns = [
    url(r'^admin/', admin_site.urls),
    url('^social/', include('social_django.urls', namespace='social')),
    url(r'^$', TemplateView.as_view(template_name='index.html')),
]


# Add the below to _patterns

# Social auth/SSO
path("", include("social_django.urls", namespace="social")),
