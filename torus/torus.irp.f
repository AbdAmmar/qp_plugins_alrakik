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
  double precision              :: test_sym
  double precision, allocatable :: eigvalues(:), eigvectors(:,:)

  PROVIDE ao_overlap

  print*, " ao_overlap : "
  do j = 1, ao_num
    write(*,"(1000(f15.7,2x))") (ao_overlap(j,i), i = 1, ao_num)
  enddo


  allocate(eigvalues(ao_num), eigvectors(ao_num,ao_num))

  call lapack_diag(eigvalues(1), eigvectors(1,1), ao_overlap(1,1), ao_num, ao_num)

  print*, "eigvalues:"
  do i = 1, ao_num
    print*, i, eigvalues(i)
  enddo

  deallocate(eigvalues, eigvectors)

end
