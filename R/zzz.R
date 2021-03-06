.onAttach <- function(lib, pkg,...){
  packageStartupMessage(rvkstatWelcomeMessage())
}

#
#

rvkstatWelcomeMessage <- function(){
  # library(utils)
  
  paste0("\n",
         "---------------------\n",
         "����� �������� � rvkstat ������ ", utils::packageDescription("rvkstat")$Version, "\n",
         "\n",
		 "��������: \n",
		 "rvkstat - R ������ ��� ���������� ������ � API ���������� ���� ���������, � �������� ������ � R. \n",
		 "\n",
         "����� ������: \n",
		 "������� �������� / Alexey Seleznev (Head of analytics dept at Netpeak).\n",
         "Email:        selesnow@gmail.com\n",
         "����:         https://alexeyseleznev.wordpress.com \n",
         "Facebook:     https://facebook.com/selesnown \n",
         "Linkedin:     https://www.linkedin.com/in/selesnow \n",
         "\n",
         "����������� ?rvkstat ��� ��������� ������� �� ���� ��������� � ������ rvkstat ��������.\n",
         "�������� ������ �� github: https://github.com/selesnow/rvkstat/\n",
         "\n",
         "������������ �� ��������� ������, � ��� �� ������ �� ������� ����� ��������� ���: https://github.com/selesnow/rvkstat/issues\n",
         "\n",
         "\t��� �� ��� ��������� ������ �� ���������� ����������� �������:  ", "suppressPackageStartupMessages(library(rvkstat))\n",
         "---------------------\n"
  )
}
