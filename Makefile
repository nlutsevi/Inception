GREEN=\033[1;32m
BLUE=\033[1;34m
WHITE=\033[0;37m
B=`tput bold`

run:
	@cd /Users/${USER}
	@mkdir data
	@chmod 777 data
	@cd data
	@mkdir wp_vol
	@chmod 777 wp_vol
	@mkdir db_vol
	@chmod 777 db_vol
	@cd /Users/${USER}/Desktop/ft_inception/srcs
	@docker-compose up -d

build:
	@cd /Users/${USER}/Desktop/ft_inception/srcs
	@docker-compose up -d

clean:
	clear
	@echo "${B}${BLUE}Cleaning containers and images...${WHITE}\n"
	@bash /Users/${USER}/Desktop/ft_inception/scripts/clear_all.sh 2>/dev/null
	@echo "${B}${GREEN}Containers and images eraised successfully...${WHITE}\n"


fclean:
	clear
	@echo "${B}${BLUE}Cleaning containers, images and volumes...${WHITE}\n"
	@bash /Users/${USER}/Desktop/ft_inception/scripts/clear_all.sh 2>/dev/null
	@bash /Users/${USER}/Desktop/ft_inception/scripts/rm_vol.sh 2>/dev/null
	@sudo rm -r /Users/${USER}/data/*
	@sudo rmdir /Users/${USER}/data
	@echo "${B}${GREEN}Containers, images and volumes eraised successfully...${WHITE}\n"

re:
	make fclean
	make run