Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7C43D0A55
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 10:11:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-gvLwnpuXPCyWCfBBV-1bJA-1; Wed, 21 Jul 2021 04:11:53 -0400
X-MC-Unique: gvLwnpuXPCyWCfBBV-1bJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A8A18031F9;
	Wed, 21 Jul 2021 08:11:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0AD360BF1;
	Wed, 21 Jul 2021 08:11:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E88A4A7C8;
	Wed, 21 Jul 2021 08:11:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16J8WBQ1027360 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 04:32:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F26021602BC; Mon, 19 Jul 2021 08:32:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEB421602B5
	for <linux-cachefs@redhat.com>; Mon, 19 Jul 2021 08:32:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4420E89C7DD
	for <linux-cachefs@redhat.com>; Mon, 19 Jul 2021 08:32:08 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
	(zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27]) by
	relay.mimecast.com with ESMTP id us-mta-377-kRCE6pfMOLm_Pfn7WJAZsA-1;
	Mon, 19 Jul 2021 04:32:03 -0400
X-MC-Unique: kRCE6pfMOLm_Pfn7WJAZsA-1
Received: from localhost.localdomain (unknown [10.162.86.133])
	by app2 (Coremail) with SMTP id XQUFCgAnqGp9OPVgl1_pBA--.3151S3;
	Mon, 19 Jul 2021 16:31:57 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Mon, 19 Jul 2021 16:31:53 +0800
Message-Id: <1626683513-64094-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-CM-TRANSID: XQUFCgAnqGp9OPVgl1_pBA--.3151S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1rGF45Zr43CF1kZw1xuFg_yoWxtFy3p3
	yayrnrtFW8W3WrXrs8XaykAw4rC34vva9rJ3y5Zr1Fyw47Xr1Yy34kJFyqyF1xJ39rJ3y7
	Zay5K39xK3y3GF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUm2NtUUUUU=
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 21 Jul 2021 04:05:57 -0400
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>
Subject: [Linux-cachefs] [PATCH] fscache: Convert from atomic_t to
	refcount_t on fscache_operation->usage
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

refcount_t type and corresponding API can protect refcounters from
accidental underflow and overflow and further use-after-free situations.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 fs/fscache/operation.c        | 38 +++++++++++++++++++-------------------
 include/linux/fscache-cache.h |  3 ++-
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/fscache/operation.c b/fs/fscache/operation.c
index 4a5651d4904e..619ed21d24e7 100644
--- a/fs/fscache/operation.c
+++ b/fs/fscache/operation.c
@@ -35,7 +35,7 @@ void fscache_operation_init(struct fscache_cookie *cookie,
 			    fscache_operation_release_t release)
 {
 	INIT_WORK(&op->work, fscache_op_work_func);
-	atomic_set(&op->usage, 1);
+	refcount_set(&op->usage, 1);
 	op->state = FSCACHE_OP_ST_INITIALISED;
 	op->debug_id = atomic_inc_return(&fscache_op_debug_id);
 	op->processor = processor;
@@ -60,12 +60,12 @@ void fscache_enqueue_operation(struct fscache_operation *op)
 	struct fscache_cookie *cookie = op->object->cookie;
 	
 	_enter("{OBJ%x OP%x,%u}",
-	       op->object->debug_id, op->debug_id, atomic_read(&op->usage));
+	       op->object->debug_id, op->debug_id, refcount_read(&op->usage));
 
 	ASSERT(list_empty(&op->pend_link));
 	ASSERT(op->processor != NULL);
 	ASSERT(fscache_object_is_available(op->object));
-	ASSERTCMP(atomic_read(&op->usage), >, 0);
+	ASSERTCMP(refcount_read(&op->usage), >, 0);
 	ASSERTIFCMP(op->state != FSCACHE_OP_ST_IN_PROGRESS,
 		    op->state, ==,  FSCACHE_OP_ST_CANCELLED);
 
@@ -74,7 +74,7 @@ void fscache_enqueue_operation(struct fscache_operation *op)
 	case FSCACHE_OP_ASYNC:
 		trace_fscache_op(cookie, op, fscache_op_enqueue_async);
 		_debug("queue async");
-		atomic_inc(&op->usage);
+		refcount_inc(&op->usage);
 		if (!queue_work(fscache_op_wq, &op->work))
 			fscache_put_operation(op);
 		break;
@@ -163,7 +163,7 @@ int fscache_submit_exclusive_op(struct fscache_object *object,
 	trace_fscache_op(object->cookie, op, fscache_op_submit_ex);
 
 	ASSERTCMP(op->state, ==, FSCACHE_OP_ST_INITIALISED);
-	ASSERTCMP(atomic_read(&op->usage), >, 0);
+	ASSERTCMP(refcount_read(&op->usage), >, 0);
 
 	spin_lock(&object->lock);
 	ASSERTCMP(object->n_ops, >=, object->n_in_progress);
@@ -190,11 +190,11 @@ int fscache_submit_exclusive_op(struct fscache_object *object,
 		object->n_exclusive++;	/* reads and writes must wait */
 
 		if (object->n_in_progress > 0) {
-			atomic_inc(&op->usage);
+			refcount_inc(&op->usage);
 			list_add_tail(&op->pend_link, &object->pending_ops);
 			fscache_stat(&fscache_n_op_pend);
 		} else if (!list_empty(&object->pending_ops)) {
-			atomic_inc(&op->usage);
+			refcount_inc(&op->usage);
 			list_add_tail(&op->pend_link, &object->pending_ops);
 			fscache_stat(&fscache_n_op_pend);
 			fscache_start_operations(object);
@@ -210,7 +210,7 @@ int fscache_submit_exclusive_op(struct fscache_object *object,
 		op->object = object;
 		object->n_ops++;
 		object->n_exclusive++;	/* reads and writes must wait */
-		atomic_inc(&op->usage);
+		refcount_inc(&op->usage);
 		list_add_tail(&op->pend_link, &object->pending_ops);
 		fscache_stat(&fscache_n_op_pend);
 		ret = 0;
@@ -245,12 +245,12 @@ int fscache_submit_op(struct fscache_object *object,
 	int ret;
 
 	_enter("{OBJ%x OP%x},{%u}",
-	       object->debug_id, op->debug_id, atomic_read(&op->usage));
+	       object->debug_id, op->debug_id, refcount_read(&op->usage));
 
 	trace_fscache_op(object->cookie, op, fscache_op_submit);
 
 	ASSERTCMP(op->state, ==, FSCACHE_OP_ST_INITIALISED);
-	ASSERTCMP(atomic_read(&op->usage), >, 0);
+	ASSERTCMP(refcount_read(&op->usage), >, 0);
 
 	spin_lock(&object->lock);
 	ASSERTCMP(object->n_ops, >=, object->n_in_progress);
@@ -276,11 +276,11 @@ int fscache_submit_op(struct fscache_object *object,
 		object->n_ops++;
 
 		if (object->n_exclusive > 0) {
-			atomic_inc(&op->usage);
+			refcount_inc(&op->usage);
 			list_add_tail(&op->pend_link, &object->pending_ops);
 			fscache_stat(&fscache_n_op_pend);
 		} else if (!list_empty(&object->pending_ops)) {
-			atomic_inc(&op->usage);
+			refcount_inc(&op->usage);
 			list_add_tail(&op->pend_link, &object->pending_ops);
 			fscache_stat(&fscache_n_op_pend);
 			fscache_start_operations(object);
@@ -292,7 +292,7 @@ int fscache_submit_op(struct fscache_object *object,
 	} else if (flags & BIT(FSCACHE_OBJECT_IS_LOOKED_UP)) {
 		op->object = object;
 		object->n_ops++;
-		atomic_inc(&op->usage);
+		refcount_inc(&op->usage);
 		list_add_tail(&op->pend_link, &object->pending_ops);
 		fscache_stat(&fscache_n_op_pend);
 		ret = 0;
@@ -370,7 +370,7 @@ int fscache_cancel_op(struct fscache_operation *op,
 
 	ASSERTCMP(op->state, >=, FSCACHE_OP_ST_PENDING);
 	ASSERTCMP(op->state, !=, FSCACHE_OP_ST_CANCELLED);
-	ASSERTCMP(atomic_read(&op->usage), >, 0);
+	ASSERTCMP(refcount_read(&op->usage), >, 0);
 
 	spin_lock(&object->lock);
 
@@ -497,11 +497,11 @@ void fscache_put_operation(struct fscache_operation *op)
 
 	_enter("{OBJ%x OP%x,%d}",
 	       op->object ? op->object->debug_id : 0,
-	       op->debug_id, atomic_read(&op->usage));
+	       op->debug_id, refcount_read(&op->usage));
 
-	ASSERTCMP(atomic_read(&op->usage), >, 0);
+	ASSERTCMP(refcount_read(&op->usage), >, 0);
 
-	if (!atomic_dec_and_test(&op->usage))
+	if (!refcount_dec_and_test(&op->usage))
 		return;
 
 	trace_fscache_op(op->object ? op->object->cookie : NULL, op, fscache_op_put);
@@ -589,7 +589,7 @@ void fscache_operation_gc(struct work_struct *work)
 		       object->debug_id, op->debug_id);
 		fscache_stat(&fscache_n_op_gc);
 
-		ASSERTCMP(atomic_read(&op->usage), ==, 0);
+		ASSERTCMP(refcount_read(&op->usage), ==, 0);
 		ASSERTCMP(op->state, ==, FSCACHE_OP_ST_DEAD);
 
 		ASSERTCMP(object->n_ops, >, 0);
@@ -619,7 +619,7 @@ void fscache_op_work_func(struct work_struct *work)
 	unsigned long start;
 
 	_enter("{OBJ%x OP%x,%d}",
-	       op->object->debug_id, op->debug_id, atomic_read(&op->usage));
+	       op->object->debug_id, op->debug_id, refcount_read(&op->usage));
 
 	trace_fscache_op(op->object->cookie, op, fscache_op_work);
 
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 3235ddbdcc09..9fddf7817948 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -14,6 +14,7 @@
 #ifndef _LINUX_FSCACHE_CACHE_H
 #define _LINUX_FSCACHE_CACHE_H
 
+#include <linux/refcount.h>
 #include <linux/fscache.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>
@@ -110,7 +111,7 @@ struct fscache_operation {
 #define FSCACHE_OP_KEEP_FLAGS	0x00f0	/* flags to keep when repurposing an op */
 
 	enum fscache_operation_state state;
-	atomic_t		usage;
+	refcount_t		usage;
 	unsigned		debug_id;	/* debugging ID */
 
 	/* operation processor callback
-- 
2.7.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

