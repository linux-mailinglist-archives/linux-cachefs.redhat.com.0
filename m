Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EA58D1B2D3E
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Apr 2020 18:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587488105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ax9cLhLjOGuMd55hrY9ntyp3aW4bui3G9ulxG9/Ib7A=;
	b=CwS/o7QTTCqK//trptX1JrC4dAbU59fecjWOTYddfVsMl7r3sC9A4bXYjp1llbp2dx+Iix
	CB8JdzNF8KNb/ZiqfUr9N28wZ8JUfDh/kFgGmxYg3Epo5ZEOGR/rOqsqzcE1GEwKdBeBLM
	onFTs6eF5fQxgR7AHMq/tDnP06Utr5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-AWd1GiDpMjaVzEflI29bdA-1; Tue, 21 Apr 2020 12:55:00 -0400
X-MC-Unique: AWd1GiDpMjaVzEflI29bdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20ED785B6EE;
	Tue, 21 Apr 2020 16:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA43476E8D;
	Tue, 21 Apr 2020 16:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B794893A78;
	Tue, 21 Apr 2020 16:54:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LGsrUc018922 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 12:54:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E8502166B2E; Tue, 21 Apr 2020 16:54:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 590722166B2B
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B93CC86BCC3
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:54:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-451-MmTeN-TcNc28lsTPFDIalw-1;
	Tue, 21 Apr 2020 12:54:45 -0400
X-MC-Unique: MmTeN-TcNc28lsTPFDIalw-1
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
	[95.90.212.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CD86A206B8;
	Tue, 21 Apr 2020 16:54:43 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jQwAU-00CmDN-1q; Tue, 21 Apr 2020 18:54:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue, 21 Apr 2020 18:54:12 +0200
Message-Id: <4467b30d614b6362e5c5e690cc43b9633b7b3ff0.1587487612.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1587487612.git.mchehab+huawei@kernel.org>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LGsrUc018922
X-loop: linux-cachefs@redhat.com
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [Linux-cachefs] [PATCH v2 01/29] docs: filesystems: convert
	caching/object.txt to ReST
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add a SPDX header;
- Adjust document and section titles;
- Comment out text ToC for html/pdf output;
- Some whitespace fixes and new line breaks;
- Adjust the events list to make them look better for html output;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/caching/fscache.txt |  2 +-
 Documentation/filesystems/caching/index.rst   |  9 ++++
 .../caching/{object.txt => object.rst}        | 43 ++++++++-----------
 Documentation/filesystems/index.rst           |  2 +
 fs/fscache/object.c                           |  2 +-
 5 files changed, 31 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/filesystems/caching/index.rst
 rename Documentation/filesystems/caching/{object.txt => object.rst} (95%)

diff --git a/Documentation/filesystems/caching/fscache.txt b/Documentation/filesystems/caching/fscache.txt
index 50f0a5757f48..071ff50a774d 100644
--- a/Documentation/filesystems/caching/fscache.txt
+++ b/Documentation/filesystems/caching/fscache.txt
@@ -191,7 +191,7 @@ The cache backend API to FS-Cache can be found in:
 A description of the internal representations and object state machine can be
 found in:
 
-	Documentation/filesystems/caching/object.txt
+	Documentation/filesystems/caching/object.rst
 
 
 =======================
diff --git a/Documentation/filesystems/caching/index.rst b/Documentation/filesystems/caching/index.rst
new file mode 100644
index 000000000000..e5ec95ff0be2
--- /dev/null
+++ b/Documentation/filesystems/caching/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Filesystem Caching
+==================
+
+.. toctree::
+   :maxdepth: 2
+
+   object
diff --git a/Documentation/filesystems/caching/object.txt b/Documentation/filesystems/caching/object.rst
similarity index 95%
rename from Documentation/filesystems/caching/object.txt
rename to Documentation/filesystems/caching/object.rst
index 100ff41127e4..ce0e043ccd33 100644
--- a/Documentation/filesystems/caching/object.txt
+++ b/Documentation/filesystems/caching/object.rst
@@ -1,10 +1,12 @@
-	     ====================================================
-	     IN-KERNEL CACHE OBJECT REPRESENTATION AND MANAGEMENT
-	     ====================================================
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================================
+In-Kernel Cache Object Representation and Management
+====================================================
 
 By: David Howells <dhowells@redhat.com>
 
-Contents:
+.. Contents:
 
  (*) Representation
 
@@ -18,8 +20,7 @@ Contents:
  (*) The set of events.
 
 
-==============
-REPRESENTATION
+Representation
 ==============
 
 FS-Cache maintains an in-kernel representation of each object that a netfs is
@@ -38,7 +39,7 @@ or even by no objects (it may not be cached).
 
 Furthermore, both cookies and objects are hierarchical.  The two hierarchies
 correspond, but the cookies tree is a superset of the union of the object trees
-of multiple caches:
+of multiple caches::
 
 	    NETFS INDEX TREE               :      CACHE 1     :      CACHE 2
 	                                   :                  :
@@ -89,8 +90,7 @@ pointers to the cookies.  The cookies themselves and any objects attached to
 those cookies are hidden from it.
 
 
-===============================
-OBJECT MANAGEMENT STATE MACHINE
+Object Management State Machine
 ===============================
 
 Within FS-Cache, each active object is managed by its own individual state
@@ -124,7 +124,7 @@ is not masked, the object will be queued for processing (by calling
 fscache_enqueue_object()).
 
 
-PROVISION OF CPU TIME
+Provision of CPU Time
 ---------------------
 
 The work to be done by the various states was given CPU time by the threads of
@@ -141,7 +141,7 @@ because:
      workqueues don't necessarily have the right numbers of threads.
 
 
-LOCKING SIMPLIFICATION
+Locking Simplification
 ----------------------
 
 Because only one worker thread may be operating on any particular object's
@@ -151,8 +151,7 @@ from the cache backend's representation (fscache_object) - which may be
 requested from either end.
 
 
-=================
-THE SET OF STATES
+The Set of States
 =================
 
 The object state machine has a set of states that it can be in.  There are
@@ -275,19 +274,17 @@ memory and potentially deletes stuff from disk:
      this state.
 
 
-THE SET OF EVENTS
+The Set of Events
 -----------------
 
 There are a number of events that can be raised to an object state machine:
 
- (*) FSCACHE_OBJECT_EV_UPDATE
-
+ FSCACHE_OBJECT_EV_UPDATE
      The netfs requested that an object be updated.  The state machine will ask
      the cache backend to update the object, and the cache backend will ask the
      netfs for details of the change through its cookie definition ops.
 
- (*) FSCACHE_OBJECT_EV_CLEARED
-
+ FSCACHE_OBJECT_EV_CLEARED
      This is signalled in two circumstances:
 
      (a) when an object's last child object is dropped and
@@ -296,20 +293,16 @@ There are a number of events that can be raised to an object state machine:
 
      This is used to proceed from the dying state.
 
- (*) FSCACHE_OBJECT_EV_ERROR
-
+ FSCACHE_OBJECT_EV_ERROR
      This is signalled when an I/O error occurs during the processing of some
      object.
 
- (*) FSCACHE_OBJECT_EV_RELEASE
- (*) FSCACHE_OBJECT_EV_RETIRE
-
+ FSCACHE_OBJECT_EV_RELEASE, FSCACHE_OBJECT_EV_RETIRE
      These are signalled when the netfs relinquishes a cookie it was using.
      The event selected depends on whether the netfs asks for the backing
      object to be retired (deleted) or retained.
 
- (*) FSCACHE_OBJECT_EV_WITHDRAW
-
+ FSCACHE_OBJECT_EV_WITHDRAW
      This is signalled when the cache backend wants to withdraw an object.
      This means that the object will have to be detached from the netfs's
      cookie.
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 0641429f53a2..f8781c13aee3 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -25,6 +25,8 @@ algorithms work.
    locking
    directory-locking
 
+   caching/index
+
    porting
 
 Filesystem support layers
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index cfeba839a0f2..efaa003b8323 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  *
- * See Documentation/filesystems/caching/object.txt for a description of the
+ * See Documentation/filesystems/caching/object.rst for a description of the
  * object state machine and the in-kernel representations.
  */
 
-- 
2.25.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

