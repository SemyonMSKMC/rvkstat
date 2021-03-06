\name{vkGetAdCategories}
\alias{vkGetAdCategories}
\title{������ ��������� �������� ��������� ���������� �� ���������}
\description{������� vkGetAdCategories ��������� ������� �� ����� ���������� ���������� � �� ����������� ������� ��������� ���������� �� ���������}
\usage{
vkGetAdCategories(account_id = NULL)
}
\arguments{
  \item{access_token}{����� ������� � API, ���������� � ������� ������� vkAuth ��� vkGetToken}
}
\value{���� ����� �� ���������� ����������:
\item{1. id}{������������� ��������.}
\item{2. name}{�������� ��������.}
\item{3. subcategories_id}{������������� ����������.}
\item{4. ubcategories_name}{�������� ����������.}
}
\author{
Alexey Seleznev
}

\examples{
##����������� � ���������
my_tok <- vkAuth(app_id = 1,client_secret = "H2Pk8htyFD8024mZaPHm")
#�������� ������ n������� � �� �����������.
vk_ad_categories <- vkGetAdCategories(access_token = my_tok$access_token)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.