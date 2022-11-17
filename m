Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451E62DE17
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 15:29:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668695364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VCSFbrM9v7n+FmTkx4T3R2Eyf+fGOURmRoXQOBbm+ag=;
	b=fm8EnAELs5eae1YobqV5Ksu16jK0ZtyAkgBFItw9hkKZeP/Ki3tvXMCOX34Tom2pAVZJA+
	+DJpdGFyHLI0l5wbgChUsvKgFEnwP/5tSWJg3UR8dxGrFvzfLQCrTGWXwU5EuiwLCzC8Jn
	huyjqebIYo5ohCHqwSig1Vys/WVCyoM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-PEfteLuDPqqKAf5ORfRBrw-1; Thu, 17 Nov 2022 09:29:21 -0500
X-MC-Unique: PEfteLuDPqqKAf5ORfRBrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 975D53C01E04;
	Thu, 17 Nov 2022 14:29:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF2A1415119;
	Thu, 17 Nov 2022 14:29:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7839919465A4;
	Thu, 17 Nov 2022 14:29:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 491BE1946595 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 14:29:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27E0939D6A; Thu, 17 Nov 2022 14:29:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D857C35429;
 Thu, 17 Nov 2022 14:29:18 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: David Howells <dhowells@redhat.com>, Daire Byrne <daire.byrne@gmail.com>,
 Benjamin Maynard <benmaynard@google.com>
Date: Thu, 17 Nov 2022 09:29:15 -0500
Message-Id: <20221117142915.1366990-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH v2] fscache: Fix oops due to race with
 cookie_lru and use_cookie
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a cookie expires from the LRU and the LRU_DISCARD flag is set,
but the state machine has not run yet, it's possible another thread
can call fscache_use_cookie and begin to use it.  When the
cookie_worker finally runs, it will see the LRU_DISCARD flag set,
transition the cookie->state to LRU_DISCARDING, which will then
withdraw the cookie.  Once the cookie is withdrawn the object is
removed the below oops will occur because the object associated
with the cookie is now NULL.

Fix the oops by clearing the LRU_DISCARD bit if another thread
uses the cookie before the cookie_worker runs.

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  ...
  CPU: 31 PID: 44773 Comm: kworker/u130:1 Tainted: G     E    6.0.0-5.dneg.x86_64 #1
  Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
  Workqueue: events_unbound netfs_rreq_write_to_cache_work [netfs]
  RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
  ...
  Call Trace:
   netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
   process_one_work+0x217/0x3e0
   worker_thread+0x4a/0x3b0
   ? process_one_work+0x3e0/0x3e0
   kthread+0xd6/0x100
   ? kthread_complete_and_exit+0x20/0x20
   ret_from_fork+0x1f/0x30

Fixes: 12bb21a29c19 ("fscache: Implement cookie user counting and resource pinning")
Reported-by: Daire Byrne <daire.byrne@gmail.com>
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/fscache/cookie.c            | 8 ++++++++
 include/trace/events/fscache.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 451d8a077e12..bce2492186d0 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -605,6 +605,14 @@ void __fscache_use_cookie(struct fscache_cookie *cookie, bool will_modify)
 			set_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE, &cookie->flags);
 			queue = true;
 		}
+		/*
+		 * We could race with cookie_lru which may set LRU_DISCARD bit
+		 * but has yet to run the cookie state machine.  If this happens
+		 * and another thread tries to use the cookie, clear LRU_DISCARD
+		 * so we don't end up withdrawing the cookie while in use.
+		 */
+		if (test_and_clear_bit(FSCACHE_COOKIE_DO_LRU_DISCARD, &cookie->flags))
+			fscache_see_cookie(cookie, fscache_cookie_see_lru_discard_clear);
 		break;
 
 	case FSCACHE_COOKIE_STATE_FAILED:
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index c078c48a8e6d..a6190aa1b406 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -66,6 +66,7 @@ enum fscache_cookie_trace {
 	fscache_cookie_put_work,
 	fscache_cookie_see_active,
 	fscache_cookie_see_lru_discard,
+	fscache_cookie_see_lru_discard_clear,
 	fscache_cookie_see_lru_do_one,
 	fscache_cookie_see_relinquish,
 	fscache_cookie_see_withdraw,
@@ -149,6 +150,7 @@ enum fscache_access_trace {
 	EM(fscache_cookie_put_work,		"PQ  work ")		\
 	EM(fscache_cookie_see_active,		"-   activ")		\
 	EM(fscache_cookie_see_lru_discard,	"-   x-lru")		\
+	EM(fscache_cookie_see_lru_discard_clear,"-   lrudc")            \
 	EM(fscache_cookie_see_lru_do_one,	"-   lrudo")		\
 	EM(fscache_cookie_see_relinquish,	"-   x-rlq")		\
 	EM(fscache_cookie_see_withdraw,		"-   x-wth")		\
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

