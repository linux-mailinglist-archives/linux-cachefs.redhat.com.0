Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3B62D9DB
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 12:50:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668685835;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gzImLZ1A5m7f7/KDZxIzkYEyQK7YbTbcFx+Jd113Fh4=;
	b=GPjN0a56CgnEIS9uym82J1T63+d1Vu2xcq7peKRpBx+K8rqqh/Pn+E7KPundZsQ8JpgbIg
	UpImFT8ywgfG6EqX1EuA85QDDuAWkCn6FPWhBDWo/qWjPjdPK9JAZZTzr8H7DXXhJxrFAE
	SUb71CqxR+evIokwQvN6oKmJxLy1+Uw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3DeIG__tM2GHRRiF2AV7Pg-1; Thu, 17 Nov 2022 06:50:32 -0500
X-MC-Unique: 3DeIG__tM2GHRRiF2AV7Pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AFD81C0A10B;
	Thu, 17 Nov 2022 11:50:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC4740E9789;
	Thu, 17 Nov 2022 11:50:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D04819465A8;
	Thu, 17 Nov 2022 11:50:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 62DC119465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 11:50:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 481FFC1E890; Thu, 17 Nov 2022 11:50:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.32.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D60C158CF;
 Thu, 17 Nov 2022 11:50:27 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: David Howells <dhowells@redhat.com>, Daire Byrne <daire.byrne@gmail.com>,
 Benjamin Maynard <benmaynard@google.com>
Date: Thu, 17 Nov 2022 06:50:23 -0500
Message-Id: <20221117115023.1350181-2-dwysocha@redhat.com>
In-Reply-To: <20221117115023.1350181-1-dwysocha@redhat.com>
References: <20221117115023.1350181-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH 1/1] fscache: Fix oops due to race with
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Reported-by: Daire Byrne <daire.byrne@gmail.com>
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/fscache/cookie.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 451d8a077e12..a90c743fec79 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -605,6 +605,13 @@ void __fscache_use_cookie(struct fscache_cookie *cookie, bool will_modify)
 			set_bit(FSCACHE_COOKIE_DO_PREP_TO_WRITE, &cookie->flags);
 			queue = true;
 		}
+		/*
+		 * We could race with cookie_lru which may set LRU_DISCARD bit
+		 * but has yet to run the cookie state machine.  If this happens
+		 * and another thread tries to use the cookie, clear LRU_DISCARD
+		 * so we don't end up withdrawing the cookie while in use.
+		 */
+		clear_bit(FSCACHE_COOKIE_DO_LRU_DISCARD, &cookie->flags);
 		break;
 
 	case FSCACHE_COOKIE_STATE_FAILED:
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

