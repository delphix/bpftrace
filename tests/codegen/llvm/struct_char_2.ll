; ModuleID = 'bpftrace'
source_filename = "bpftrace"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf-pc-linux"

; Function Attrs: nounwind
declare i64 @llvm.bpf.pseudo(i64, i64) #0

define i64 @"kprobe:f"(i8*) section "s_kprobe:f_1" {
entry:
  %"@x_val" = alloca i64
  %"@x_key" = alloca i64
  %"struct Foo.x" = alloca i8
  %"$foo" = alloca i64
  %1 = bitcast i64* %"$foo" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %1)
  store i64 0, i64* %"$foo"
  %2 = bitcast i8* %0 to i64*
  %3 = getelementptr i64, i64* %2, i64 14
  %arg0 = load volatile i64, i64* %3
  %4 = bitcast i64* %"$foo" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %4)
  store i64 %arg0, i64* %"$foo"
  %5 = load i64, i64* %"$foo"
  %6 = add i64 %5, 0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %"struct Foo.x")
  %probe_read_kernel = call i64 inttoptr (i64 113 to i64 (i8*, i32, i64)*)(i8* %"struct Foo.x", i32 1, i64 %6)
  %7 = load i8, i8* %"struct Foo.x"
  %8 = sext i8 %7 to i64
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %"struct Foo.x")
  %9 = bitcast i64* %"@x_key" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %9)
  store i64 0, i64* %"@x_key"
  %10 = bitcast i64* %"@x_val" to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %10)
  store i64 %8, i64* %"@x_val"
  %pseudo = call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %update_elem = call i64 inttoptr (i64 2 to i64 (i64, i64*, i64*, i64)*)(i64 %pseudo, i64* %"@x_key", i64* %"@x_val", i64 0)
  %11 = bitcast i64* %"@x_key" to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %11)
  %12 = bitcast i64* %"@x_val" to i8*
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %12)
  ret i64 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

attributes #0 = { nounwind }
attributes #1 = { argmemonly nounwind }
