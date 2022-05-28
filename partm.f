      program rc4
      integer, parameter:: N = 3, M = 20
      integer i
      real, parameter:: A = 0.4, C = 0.4, B = 10, E = 5, D = 5
      real, parameter:: eps = 0.01, tau = 0.01, tmax=400
      real Y(N), YT(N), YN(N), alp, t
      real k1(N), k2(N), k3(N), k4(N)

      open(12, FILE = 'data1.txt')
      open(13, FILE = 'data2.txt')
      open(14, FILE = 'data3.txt')
      open(15, FILE = 'data4.txt')
      open(16, FILE = 'data5.txt')
      open(17, FILE = 'data6.txt')

      alp = 0

      do i=1,M
         t = 0
         alp = alp + 0.025
         Y(3) = 0.224
         Y(2) = sqrt((A*alp*Y(3))/(E*(1+B*Y(3))))
         Y(1) = (alp*Y(3))/(E*Y(2))
         Y(1) = Y(1) + eps
         Y(2) = Y(2) + eps
         Y(3) = Y(3) + eps

         write (12, *) t, Y(1)
         write (13, *) t, Y(2)
         write (14, *) t, Y(3)
         write (15, *) Y(1), Y(2)
         write (16, *) Y(2), Y(3)
         write (17, *) Y(1), Y(3) 

         do while (t<=tmax)
            t = t + tau
            
            k1(1) = (-A*Y(1)+Y(2)+B*Y(2)*Y(3))
            k1(2) = (-Y(1)-C*Y(2)+D*Y(1)*Y(3))
            k1(3) = (alp*Y(3)-E*Y(1)*Y(2))

            YT(1) = Y(1)+(tau/2)*k1(1);
            YT(2) = Y(2)+(tau/2)*k1(2);
            YT(3) = Y(3)+(tau/2)*k1(3);
            k2(1) = (-A*YT(1)+YT(2)+B*YT(2)*YT(3))
            k2(2) = (-YT(1)-C*YT(2)+D*YT(1)*YT(3))
            k2(3) = (alp*YT(3)-E*YT(1)*YT(2))

            YT(1) = Y(1)+(tau/2)*k2(1);
            YT(2) = Y(2)+(tau/2)*k2(2);
            YT(3) = Y(3)+(tau/2)*k2(3);
            k3(1) = (-A*YT(1)+YT(2)+B*YT(2)*YT(3))
            k3(2) = (-YT(1)-C*YT(2)+D*YT(1)*YT(3))
            k3(3) = (alp*YT(3)-E*YT(1)*YT(2))

            YT(1) = Y(1)+tau*k3(1);
            YT(2) = Y(2)+tau*k3(2);
            YT(3) = Y(3)+tau*k3(3);
            k4(1) = (-A*YT(1)+YT(2)+B*YT(2)*YT(3))
            k4(2) = (-YT(1)-C*YT(2)+D*YT(1)*YT(3))
            k4(3) = (alp*YT(3)-E*YT(1)*YT(2))

            YN(1) = Y(1)+(tau/6)*(k1(1)+2*k2(1)+2*k3(1)+k4(1));
            YN(2) = Y(2)+(tau/6)*(k1(2)+2*k2(2)+2*k3(2)+k4(2));
            YN(3) = Y(3)+(tau/6)*(k1(3)+2*k2(3)+2*k3(3)+k4(3));

            Y(1) = YN(1)
            Y(2) = YN(2)
            Y(3) = YN(3)

            write (12, *) t, Y(1)
            write (13, *) t, Y(2)
            write (14, *) t, Y(3)
            write (15, *) Y(1), Y(2)
            write (16, *) Y(2), Y(3)
            write (17, *) Y(1), Y(3) 
         end do

         write(12, *)
         write(12, *)
         write(13, *)
         write(13, *)
         write(14, *)
         write(14, *)
         write(15, *)
         write(15, *)
         write(16, *)
         write(16, *)
         write(17, *)
         write(17, *)
      end do

      close(17)
      close(16)
      close(15)
      close(14)
      close(13)
      close(12)
      end program