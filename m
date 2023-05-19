Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABD709E51
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 May 2023 19:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684517805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Bf9St2OukC4kbvqJU4LxCi671NU1jYU9WtRSrKZwLo=;
	b=A80qvUiEszUd+W2jDawokp3KnlEipMugwYbWPGcYV8t/QfaSFdxliVLU12t4SC7kiidqDg
	JM3EG6iaKaA2khCuTw3hF5xtIFYbgsz/oVag1FEg7F2l3Dgg6Edn9SDA4Kz4ZxSsd0K3gq
	z0fYtbVd61Z45HWq/UOfl6t3s6w9c/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-dAvDi3ktP_2l1AtVyFWTkw-1; Fri, 19 May 2023 13:36:42 -0400
X-MC-Unique: dAvDi3ktP_2l1AtVyFWTkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7484101A52C;
	Fri, 19 May 2023 17:36:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE0F17B7C;
	Fri, 19 May 2023 17:36:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6EE1219465B7;
	Fri, 19 May 2023 17:36:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CDD419465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 19 May 2023 17:36:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 60180140E955; Fri, 19 May 2023 17:36:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFB7C140E954;
 Fri, 19 May 2023 17:36:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Fri, 19 May 2023 18:36:39 +0100
Message-ID: <1853806.1684517799@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH] cachefilesd: Remove pointer poisoning code
 as it is likely to fail under ASLR
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1853805.1684517798.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    
The pointer checking code assumes that addresses in the range 0x60000000 to
0x6fffffff are not going to be encountered and can thus be used to poison
dead pointers.  Unfortunately, this assumption breaks occasionally on
systems with address space layout randomisation.

Remove the poisoning and, in particular, the poison checking which will cause
the process to abort with no message as to why.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 cachefilesd.c |   25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/cachefilesd.c b/cachefilesd.c
index d4d236f..6c435f6 100644
--- a/cachefilesd.c
+++ b/cachefilesd.c
@@ -1092,7 +1092,6 @@ static void put_object(struct object *object)
 
 	parent = object->parent;
 
-	memset(object, 0x6d, sizeof(struct object));
 	free(object);
 
 	if (parent)
@@ -1213,7 +1212,6 @@ static void insert_into_cull_table(struct object *object)
 
 	/* newest object in table will be displaced by this one */
 	put_object(cullbuild[0]);
-	cullbuild[0] = (void *)(0x6b000000 | __LINE__);
 	object->usage++;
 
 	/* place directly in first slot if second is older */
@@ -1391,7 +1389,7 @@ next:
 
 			if (loop == nr_in_ready_table - 1) {
 				/* child was oldest object */
-				cullready[--nr_in_ready_table] = (void *)(0x6b000000 | __LINE__);
+				cullready[--nr_in_ready_table] = NULL;
 				put_object(child);
 				goto removed;
 			}
@@ -1400,7 +1398,7 @@ next:
 				memmove(&cullready[loop],
 					&cullready[loop + 1],
 					(nr_in_ready_table - (loop + 1)) * sizeof(cullready[0]));
-				cullready[--nr_in_ready_table] = (void *)(0x6b000000 | __LINE__);
+				cullready[--nr_in_ready_table] = NULL;
 				put_object(child);
 				goto removed;
 			}
@@ -1411,7 +1409,7 @@ next:
 
 			if (loop == nr_in_build_table - 1) {
 				/* child was oldest object */
-				cullbuild[--nr_in_build_table] = (void *)(0x6b000000 | __LINE__);
+				cullbuild[--nr_in_build_table] = NULL;
 				put_object(child);
 			}
 			else if (loop < nr_in_build_table - 1) {
@@ -1419,7 +1417,7 @@ next:
 				memmove(&cullbuild[loop],
 					&cullbuild[loop + 1],
 					(nr_in_build_table - (loop + 1)) * sizeof(cullbuild[0]));
-				cullbuild[--nr_in_build_table] = (void *)(0x6b000000 | __LINE__);
+				cullbuild[--nr_in_build_table] = NULL;
 				put_object(child);
 			}
 
@@ -1531,10 +1529,10 @@ static void decant_cull_table(void)
 
 		n = copy * sizeof(cullready[0]);
 		memcpy(cullready, cullbuild, n);
-		memset(cullbuild, 0x6e, n);
+		memset(cullbuild, 0, n);
 		nr_in_ready_table = nr_in_build_table;
 		nr_in_build_table = 0;
-		goto check;
+		return;
 	}
 
 	/* decant some of the build table if there's space */
@@ -1542,7 +1540,7 @@ static void decant_cull_table(void)
 		error("Less than zero space in ready table");
 	space = culltable_size - nr_in_ready_table;
 	if (space == 0)
-		goto check;
+		return;
 
 	/* work out how much of the build table we can copy */
 	copy = avail = nr_in_build_table;
@@ -1559,16 +1557,11 @@ static void decant_cull_table(void)
 	nr_in_ready_table += copy;
 
 	memcpy(&cullready[0], &cullbuild[leave], copy * sizeof(cullready[0]));
-	memset(&cullbuild[leave], 0x6b, copy * sizeof(cullbuild[0]));
+	memset(&cullbuild[leave], 0, copy * sizeof(cullbuild[0]));
 	nr_in_build_table = leave;
 
 	if (copy + leave > culltable_size)
 		error("Scan table exceeded (%d+%d)", copy, leave);
-
-check:
-	for (loop = 0; loop < nr_in_ready_table; loop++)
-		if (((long)cullready[loop] & 0xf0000000) == 0x60000000)
-			abort();
 }
 
 /*****************************************************************************/
@@ -1645,6 +1638,6 @@ static void cull_objects(void)
 
 	if (cullready[nr_in_ready_table - 1]->cullable) {
 		cull_object(cullready[nr_in_ready_table - 1]);
-		cullready[--nr_in_ready_table] = (void *)(0x6b000000 | __LINE__);
+		cullready[--nr_in_ready_table] = NULL;
 	}
 }
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

