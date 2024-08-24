program torus
  implicit none
  BEGIN_DOC
! TODO : Put the documentation of the program here
  END_DOC
  print *, 'Hello world'
  call main()
end


subroutine main()

  implicit none
  integer                       :: i, j
  double precision, allocatable :: eigvalues(:), eigvectors(:,:)

  PROVIDE ao_overlap

!  print*, " ao_overlap : "
!  do i = 1, ao_num
!    do j = 1, ao_num
!      print *, j, i, ao_overlap(j,i)
!    enddo
!  enddo


  allocate(eigvalues(ao_num), eigvectors(ao_num,ao_num))

  call lapack_diag(eigvalues, eigvectors, ao_overlap, ao_num, ao_num)

  print*, "eigvalues:"
  do i = 1, ao_num
    print*, i, eigvalues(i)
  enddo

  deallocate(eigvalues, eigvectors)

end
