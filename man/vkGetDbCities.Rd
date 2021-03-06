\name{vkGetDbCities}
\alias{vkGetDbCities}
\title{������ �����.}
\description{������� vkGetDbCities ���������� ������ �����.}
\usage{
vkGetDbCities(country_id = NULL, region_id = NULL, q = NULL, need_all = TRUE, access_token = NULL)
}
\arguments{
  \item{country_id}{������������� ������, ���������� � ������� ������� vkGetDbCountries.}
  \item{region_id}{������������� �������, ������ �������� ���������� ��������. (�������� �� ����������).}
  \item{q}{������ ���������� �������. ��������, "�����". ������������ ����� ������ � 15 ��������.}
  \item{need_all}{���������� TRUE ��� FALSE, ���� - ������� ������ ���� �����.}
  \item{access_token}{����� ������� � API, ���������� � ������� ������� vkAuth ��� vkGetToken}
}
\value{���� ����� �� ����������� ���������� �� ���������� ����������:
\item{1. cid}{������������� ������.}
\item{2. title}{�������� ������.}
\item{3. important }{������� �������� ������� ��� �������� ������������.}
\item{4. area}{�������.}
\item{5. region }{������.}
}
\details{
���� �� ����� �������� q, �� ����� ��������� ������ ����� ������� ������� � �������� ������. ���� ����� �������� q, �� ����� ��������� ������ �������, ������� ���������� ���������� �������. 
}
\author{
Alexey Seleznev
}

\examples{
##����������� � ��
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

##�������� ������ ������� ��� �������, �.�. id ������� = 2
vk_cities <- vkGetDbCities(country_id = 2,
                           access_token = my_tok$access_token)

##�������� ������ ������� �� ���������� ������� "�����"
vk_cities_search <- vkGetDbCities(country_id = 1,
                                  q = "�����",
                                  access_token = my_tok$access_token)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
