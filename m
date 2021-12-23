Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48747E66D
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 17:35:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-ayTd82LBO0SypS6yhuDB7g-1; Thu, 23 Dec 2021 11:35:35 -0500
X-MC-Unique: ayTd82LBO0SypS6yhuDB7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E154D1DDF2;
	Thu, 23 Dec 2021 16:35:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 560F219711;
	Thu, 23 Dec 2021 16:35:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C3804BB7C;
	Thu, 23 Dec 2021 16:35:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BNGZOfw003152 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 23 Dec 2021 11:35:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89248515989; Thu, 23 Dec 2021 16:35:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85811515986
	for <linux-cachefs@redhat.com>; Thu, 23 Dec 2021 16:35:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C3ED811E76
	for <linux-cachefs@redhat.com>; Thu, 23 Dec 2021 16:35:24 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-602-of2PdroQP4SetoV8hqB2fw-1; Thu, 23 Dec 2021 11:35:20 -0500
X-MC-Unique: of2PdroQP4SetoV8hqB2fw-1
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org
Date: Thu, 23 Dec 2021 17:35:00 +0100
Message-Id: <20211223163500.2625491-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BNGZOfw003152
X-loop: linux-cachefs@redhat.com
Cc: Gregor Beck <gregor.beck@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH REPOST REPOST v2] fscache: Use only one
	fscache_object_cong_wait.
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the commit mentioned below, fscache was converted from slow-work to
workqueue. slow_work_enqueue() and slow_work_sleep_till_thread_needed()
did not use a per-CPU workqueue. They choose from two global waitqueues
depending on the SLOW_WORK_VERY_SLOW bit which was not set so it always
one waitqueue.

I can't find out how it is ensured that a waiter on certain CPU is woken
up be the other side. My guess is that the timeout in schedule_timeout()
ensures that it does not wait forever (or a random wake up).

fscache_object_sleep_till_congested() must be invoked from preemptible
context in order for schedule() to work. In this case this_cpu_ptr()
should complain with CONFIG_DEBUG_PREEMPT enabled except the thread is
bound to one CPU.

wake_up() wakes only one waiter and I'm not sure if it is guaranteed
that only one waiter exists.

Replace the per-CPU waitqueue with one global waitqueue.

Fixes: 8b8edefa2fffb ("fscache: convert object to use workqueue instead of slow-work")
Reported-by: Gregor Beck <gregor.beck@gmail.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v2: https://lore.kernel.org/all/20211029083839.xwwt7jgzru3kcpii@linutronix.de/
Repost: https://lore.kernel.org/all/20211118165442.hekmz7xgisdzsyuh@linutronix.de/
Ping 1: https://lore.kernel.org/all/20211202205240.giqxuxqemlxxoobw@linutronix.de/
|I noticed that -next gained commit
|   608bfec640edb ("fscache: Remove the contents of the fscache driver, pending rewrite")
|
|which removes slow_work_sleep_till_thread_needed() and the per-CPU
|variable. Since it looks like a bug, what happens stable wise?

Ping 2: https://lore.kernel.org/all/YbdiYN+wU1RN9mWo@linutronix.de/

 fs/fscache/internal.h |  1 -
 fs/fscache/main.c     |  6 ------
 fs/fscache/object.c   | 13 +++++--------
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index c3e4804b8fcbf..9edb87e11680b 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -81,7 +81,6 @@ extern unsigned fscache_debug;
 extern struct kobject *fscache_root;
 extern struct workqueue_struct *fscache_object_wq;
 extern struct workqueue_struct *fscache_op_wq;
-DECLARE_PER_CPU(wait_queue_head_t, fscache_object_cong_wait);
 
 extern unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n);
 
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index 4207f98e405fd..85f8cf3a323d5 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -41,8 +41,6 @@ struct kobject *fscache_root;
 struct workqueue_struct *fscache_object_wq;
 struct workqueue_struct *fscache_op_wq;
 
-DEFINE_PER_CPU(wait_queue_head_t, fscache_object_cong_wait);
-
 /* these values serve as lower bounds, will be adjusted in fscache_init() */
 static unsigned fscache_object_max_active = 4;
 static unsigned fscache_op_max_active = 2;
@@ -138,7 +136,6 @@ unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n)
 static int __init fscache_init(void)
 {
 	unsigned int nr_cpus = num_possible_cpus();
-	unsigned int cpu;
 	int ret;
 
 	fscache_object_max_active =
@@ -161,9 +158,6 @@ static int __init fscache_init(void)
 	if (!fscache_op_wq)
 		goto error_op_wq;
 
-	for_each_possible_cpu(cpu)
-		init_waitqueue_head(&per_cpu(fscache_object_cong_wait, cpu));
-
 	ret = fscache_proc_init();
 	if (ret < 0)
 		goto error_proc;
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 6a675652129b2..7a972d144b546 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -798,6 +798,8 @@ void fscache_object_destroy(struct fscache_object *object)
 }
 EXPORT_SYMBOL(fscache_object_destroy);
 
+static DECLARE_WAIT_QUEUE_HEAD(fscache_object_cong_wait);
+
 /*
  * enqueue an object for metadata-type processing
  */
@@ -806,16 +808,12 @@ void fscache_enqueue_object(struct fscache_object *object)
 	_enter("{OBJ%x}", object->debug_id);
 
 	if (fscache_get_object(object, fscache_obj_get_queue) >= 0) {
-		wait_queue_head_t *cong_wq =
-			&get_cpu_var(fscache_object_cong_wait);
 
 		if (queue_work(fscache_object_wq, &object->work)) {
 			if (fscache_object_congested())
-				wake_up(cong_wq);
+				wake_up(&fscache_object_cong_wait);
 		} else
 			fscache_put_object(object, fscache_obj_put_queue);
-
-		put_cpu_var(fscache_object_cong_wait);
 	}
 }
 
@@ -833,16 +831,15 @@ void fscache_enqueue_object(struct fscache_object *object)
  */
 bool fscache_object_sleep_till_congested(signed long *timeoutp)
 {
-	wait_queue_head_t *cong_wq = this_cpu_ptr(&fscache_object_cong_wait);
 	DEFINE_WAIT(wait);
 
 	if (fscache_object_congested())
 		return true;
 
-	add_wait_queue_exclusive(cong_wq, &wait);
+	add_wait_queue_exclusive(&fscache_object_cong_wait, &wait);
 	if (!fscache_object_congested())
 		*timeoutp = schedule_timeout(*timeoutp);
-	finish_wait(cong_wq, &wait);
+	finish_wait(&fscache_object_cong_wait, &wait);
 
 	return fscache_object_congested();
 }
-- 
2.34.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

