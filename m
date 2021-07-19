Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E37C33D0A39
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 10:06:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-BQknqUv-PFKLEWbgithtdQ-1; Wed, 21 Jul 2021 04:06:06 -0400
X-MC-Unique: BQknqUv-PFKLEWbgithtdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD1B2802920;
	Wed, 21 Jul 2021 08:06:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9922360E3A;
	Wed, 21 Jul 2021 08:06:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C99111801028;
	Wed, 21 Jul 2021 08:05:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16J68ufk015441 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 02:08:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCE2221686B3; Mon, 19 Jul 2021 06:08:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F3721686BF
	for <linux-cachefs@redhat.com>; Mon, 19 Jul 2021 06:08:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 271901064E6A
	for <linux-cachefs@redhat.com>; Mon, 19 Jul 2021 06:08:53 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
	(zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27]) by
	relay.mimecast.com with ESMTP id us-mta-371-lq4r89KbNtau5k6nxEDPWg-1;
	Mon, 19 Jul 2021 02:08:49 -0400
X-MC-Unique: lq4r89KbNtau5k6nxEDPWg-1
Received: from localhost.localdomain (unknown [10.162.86.133])
	by app2 (Coremail) with SMTP id XQUFCgAn32j4FPVgnkfoBA--.1815S3;
	Mon, 19 Jul 2021 14:00:24 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Mon, 19 Jul 2021 14:00:20 +0800
Message-Id: <1626674421-55948-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-CM-TRANSID: XQUFCgAn32j4FPVgnkfoBA--.1815S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3tF17ZrWxKFWfGw4xCrg_yoW5JFW3pa
	9rCr1xCFW8Zr17Ar4rXw4jkr1rX34DJ3W7X34xZw4ruw4agr4UXws7CF1YvF93u3yIyay3
	ZF45Kwn8Cws8Xr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbX18DUUUUU==
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
	refcount_t on fscache_cache_tag->usage
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
 fs/fscache/cache.c            | 8 ++++----
 include/linux/fscache-cache.h | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index fcc136361415..a17faaae3668 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -29,7 +29,7 @@ struct fscache_cache_tag *__fscache_lookup_cache_tag(const char *name)
 
 	list_for_each_entry(tag, &fscache_cache_tag_list, link) {
 		if (strcmp(tag->name, name) == 0) {
-			atomic_inc(&tag->usage);
+			refcount_inc(&tag->usage);
 			up_read(&fscache_addremove_sem);
 			return tag;
 		}
@@ -43,7 +43,7 @@ struct fscache_cache_tag *__fscache_lookup_cache_tag(const char *name)
 		/* return a dummy tag if out of memory */
 		return ERR_PTR(-ENOMEM);
 
-	atomic_set(&xtag->usage, 1);
+	refcount_set(&xtag->usage, 1);
 	strcpy(xtag->name, name);
 
 	/* write lock, search again and add if still not present */
@@ -51,7 +51,7 @@ struct fscache_cache_tag *__fscache_lookup_cache_tag(const char *name)
 
 	list_for_each_entry(tag, &fscache_cache_tag_list, link) {
 		if (strcmp(tag->name, name) == 0) {
-			atomic_inc(&tag->usage);
+			refcount_inc(&tag->usage);
 			up_write(&fscache_addremove_sem);
 			kfree(xtag);
 			return tag;
@@ -71,7 +71,7 @@ void __fscache_release_cache_tag(struct fscache_cache_tag *tag)
 	if (tag != ERR_PTR(-ENOMEM)) {
 		down_write(&fscache_addremove_sem);
 
-		if (atomic_dec_and_test(&tag->usage))
+		if (refcount_dec_and_test(&tag->usage))
 			list_del_init(&tag->link);
 		else
 			tag = NULL;
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 3235ddbdcc09..d3c609cfd762 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -14,6 +14,7 @@
 #ifndef _LINUX_FSCACHE_CACHE_H
 #define _LINUX_FSCACHE_CACHE_H
 
+#include <linux/refcount.h>
 #include <linux/fscache.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>
@@ -45,7 +46,7 @@ struct fscache_cache_tag {
 	struct fscache_cache	*cache;		/* cache referred to by this tag */
 	unsigned long		flags;
 #define FSCACHE_TAG_RESERVED	0		/* T if tag is reserved for a cache */
-	atomic_t		usage;
+	refcount_t		usage;
 	char			name[];	/* tag name */
 };
 
-- 
2.7.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

