# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pmunoz-p <pmunoz-p@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/18 17:22:02 by pmunoz-p          #+#    #+#              #
#    Updated: 2024/10/23 09:52:36 by pmunoz-p         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT			=	client

BONUS			= 	./bonus/

CLIENT_B		=	${BONUS}client_bonus

SERVER			=	server

SERVER_B		=	${BONUS}server_bonus

SRCS_CLIENT 	= 	./client.c \

SRCS_CLIENT_B	=	${BONUS}client_bonus.c \

SRCS_SERVER 	=	./server.c \

SRCS_SERVER_B 	=	${BONUS}server_bonus.c \

OBJS_CLIENT 	=	${SRCS_CLIENT:.c=.o}
OBJS_CLIENT_B 	=	${SRCS_CLIENT_B:.c=.o}
OBJS_SERVER 	=	${SRCS_SERVER:.c=.o}
OBJS_SERVER_B 	=	${SRCS_SERVER_B:.c=.o}

CC				=	gcc

CFLAGS			=	-Wall -Wextra -Werror

RM				=	rm -rf

all:			${SERVER} ${CLIENT}

bonus:			${CLIENT_B} ${SERVER_B}

.c.o:			${CC} ${CFLAGS} -c $< o ${<:.c=.o}

${CLIENT}:		${OBJS_CLIENT}
				${CC} ${CFLAGS} -o ${CLIENT} ${OBJS_CLIENT}

${SERVER}:		${OBJS_SERVER}
				${CC} ${CFLAGS} -o ${SERVER} ${OBJS_SERVER}

${CLIENT_B}:	${OBJS_CLIENT_B}
				${CC} ${CFLAGS} -o ${CLIENT_B} ${OBJS_CLIENT_B}

${SERVER_B}:	${OBJS_SERVER_B}
				${CC} ${CFLAGS} -o ${SERVER_B} ${OBJS_SERVER_B}

clean:
				${RM} ${OBJS_CLIENT} ${OBJS_SERVER} ${OBJS_CLIENT_B} ${OBJS_SERVER_B}

fclean:			clean
				${RM} ${CLIENT} ${SERVER} ${CLIENT_B} ${SERVER_B}

re:				fclean all

.PHONY:			all bonus clean fclean re
