Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9960E1B2D86
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Apr 2020 18:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587488228;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zv5njfXSlIxIR+HpivKpbZL+THxLc8BrRfdytIGgfvE=;
	b=ZZDR4lxM9QV4n8KKm12s98h8xz6IPRQ1hZkVBYbvwCqal4i0WofI22CuDmnKiUiASShfk8
	C6Vi3G2gV/Q/XNVYazyGD4sONwoxMTt+veOPpmBm003ZTdrHy9ktUKQag4vgLbO7RCIGOU
	6Q+AeCDg5EG/r27CIU9BYVsodDPzsas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-qFnFXGeUNj2quYZ4pDulvw-1; Tue, 21 Apr 2020 12:57:06 -0400
X-MC-Unique: qFnFXGeUNj2quYZ4pDulvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123708010E4;
	Tue, 21 Apr 2020 16:57:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D8BB3A7E;
	Tue, 21 Apr 2020 16:57:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8446918089C8;
	Tue, 21 Apr 2020 16:57:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LGv0T3019240 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 12:57:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C01DBA09A4; Tue, 21 Apr 2020 16:57:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast02.extmail.prod.ext.phx2.redhat.com [10.5.110.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA3FEA098A
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:56:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD8EC107ACC4
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:56:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-202-Of5YPCY2O5e23DbPoY8SKA-1;
	Tue, 21 Apr 2020 12:54:45 -0400
X-MC-Unique: Of5YPCY2O5e23DbPoY8SKA-1
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
	[95.90.212.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E28622070B;
	Tue, 21 Apr 2020 16:54:43 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jQwAU-00CmDZ-4b; Tue, 21 Apr 2020 18:54:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue, 21 Apr 2020 18:54:15 +0200
Message-Id: <e2ee5ee7cc5fb0e2b4f4277123ce7ccaf5dddb35.1587487612.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1587487612.git.mchehab+huawei@kernel.org>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LGv0T3019240
X-loop: linux-cachefs@redhat.com
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [Linux-cachefs] [PATCH v2 04/29] docs: filesystems:
	caching/operations.txt: convert it to ReST
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add a SPDX header;
- Adjust document and section titles;
- Comment out text ToC for html/pdf output;
- Mark literal blocks as such;
- Add it to filesystems/caching/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/caching/index.rst   |  1 +
 .../{operations.txt => operations.rst}        | 45 +++++++++----------
 fs/fscache/operation.c                        |  2 +-
 3 files changed, 23 insertions(+), 25 deletions(-)
 rename Documentation/filesystems/caching/{operations.txt => operations.rst} (90%)

diff --git a/Documentation/filesystems/caching/index.rst b/Documentation/filesystems/caching/index.rst
index d0651db450fb..75492b7c8ea0 100644
--- a/Documentation/filesystems/caching/index.rst
+++ b/Documentation/filesystems/caching/index.rst
@@ -9,3 +9,4 @@ Filesystem Caching
    fscache
    object
    netfs-api
+   operations
diff --git a/Documentation/filesystems/caching/operations.txt b/Documentation/filesystems/caching/operations.rst
similarity index 90%
rename from Documentation/filesystems/caching/operations.txt
rename to Documentation/filesystems/caching/operations.rst
index d8976c434718..f7ddcc028939 100644
--- a/Documentation/filesystems/caching/operations.txt
+++ b/Documentation/filesystems/caching/operations.rst
@@ -1,10 +1,12 @@
-		       ================================
-		       ASYNCHRONOUS OPERATIONS HANDLING
-		       ================================
+.. SPDX-License-Identifier: GPL-2.0
+
+================================
+Asynchronous Operations Handling
+================================
 
 By: David Howells <dhowells@redhat.com>
 
-Contents:
+.. Contents:
 
  (*) Overview.
 
@@ -17,8 +19,7 @@ Contents:
  (*) Asynchronous callback.
 
 
-========
-OVERVIEW
+Overview
 ========
 
 FS-Cache has an asynchronous operations handling facility that it uses for its
@@ -33,11 +34,10 @@ backend for completion.
 To make use of this facility, <linux/fscache-cache.h> should be #included.
 
 
-===============================
-OPERATION RECORD INITIALISATION
+Operation Record Initialisation
 ===============================
 
-An operation is recorded in an fscache_operation struct:
+An operation is recorded in an fscache_operation struct::
 
 	struct fscache_operation {
 		union {
@@ -50,7 +50,7 @@ An operation is recorded in an fscache_operation struct:
 	};
 
 Someone wanting to issue an operation should allocate something with this
-struct embedded in it.  They should initialise it by calling:
+struct embedded in it.  They should initialise it by calling::
 
 	void fscache_operation_init(struct fscache_operation *op,
 				    fscache_operation_release_t release);
@@ -67,8 +67,7 @@ FSCACHE_OP_WAITING may be set in op->flags prior to each submission of the
 operation and waited for afterwards.
 
 
-==========
-PARAMETERS
+Parameters
 ==========
 
 There are a number of parameters that can be set in the operation record's flag
@@ -87,7 +86,7 @@ operations:
 
      If this option is to be used, FSCACHE_OP_WAITING must be set in op->flags
      before submitting the operation, and the operating thread must wait for it
-     to be cleared before proceeding:
+     to be cleared before proceeding::
 
 		wait_on_bit(&op->flags, FSCACHE_OP_WAITING,
 			    TASK_UNINTERRUPTIBLE);
@@ -101,7 +100,7 @@ operations:
      page to a netfs page after the backing fs has read the page in.
 
      If this option is used, op->fast_work and op->processor must be
-     initialised before submitting the operation:
+     initialised before submitting the operation::
 
 		INIT_WORK(&op->fast_work, do_some_work);
 
@@ -114,7 +113,7 @@ operations:
      pages that have just been fetched from a remote server.
 
      If this option is used, op->slow_work and op->processor must be
-     initialised before submitting the operation:
+     initialised before submitting the operation::
 
 		fscache_operation_init_slow(op, processor)
 
@@ -132,8 +131,7 @@ Furthermore, operations may be one of two types:
      operations running at the same time.
 
 
-=========
-PROCEDURE
+Procedure
 =========
 
 Operations are used through the following procedure:
@@ -143,7 +141,7 @@ Operations are used through the following procedure:
      generic op embedded within.
 
  (2) The submitting thread must then submit the operation for processing using
-     one of the following two functions:
+     one of the following two functions::
 
 	int fscache_submit_op(struct fscache_object *object,
 			      struct fscache_operation *op);
@@ -164,7 +162,7 @@ Operations are used through the following procedure:
      operation of conflicting exclusivity is in progress on the object.
 
      If the operation is asynchronous, the manager will retain a reference to
-     it, so the caller should put their reference to it by passing it to:
+     it, so the caller should put their reference to it by passing it to::
 
 	void fscache_put_operation(struct fscache_operation *op);
 
@@ -179,12 +177,12 @@ Operations are used through the following procedure:
  (4) The operation holds an effective lock upon the object, preventing other
      exclusive ops conflicting until it is released.  The operation can be
      enqueued for further immediate asynchronous processing by adjusting the
-     CPU time provisioning option if necessary, eg:
+     CPU time provisioning option if necessary, eg::
 
 	op->flags &= ~FSCACHE_OP_TYPE;
 	op->flags |= ~FSCACHE_OP_FAST;
 
-     and calling:
+     and calling::
 
 	void fscache_enqueue_operation(struct fscache_operation *op)
 
@@ -192,13 +190,12 @@ Operations are used through the following procedure:
      pools.
 
 
-=====================
-ASYNCHRONOUS CALLBACK
+Asynchronous Callback
 =====================
 
 When used in asynchronous mode, the worker thread pool will invoke the
 processor method with a pointer to the operation.  This should then get at the
-container struct by using container_of():
+container struct by using container_of()::
 
 	static void fscache_write_op(struct fscache_operation *_op)
 	{
diff --git a/fs/fscache/operation.c b/fs/fscache/operation.c
index 1a22a55f75a0..4a5651d4904e 100644
--- a/fs/fscache/operation.c
+++ b/fs/fscache/operation.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2008 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  *
- * See Documentation/filesystems/caching/operations.txt
+ * See Documentation/filesystems/caching/operations.rst
  */
 
 #define FSCACHE_DEBUG_LEVEL OPERATION
-- 
2.25.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

