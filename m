Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D428B63E0C3
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Nov 2022 20:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669836431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sfZxZCHUSJKJk1CWuSO0phIgSUHy5//rpji+d8KozGQ=;
	b=SEPXhptV2+sGRm/aUexgGzjeT+BdRLuCwQIDd3+RTt+YKmXLsM3PZ7ZTIB1uKn8gM6UBDR
	iE5Oe1hEfluUheLHcdl8XgvUzYzrfWUZV9ntSLCjWNigelWb7U0ek491R/fz9BN+DxoDLg
	Pw0LbR6teuwPG8Y1S4tMr3lUbxx+4nY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-iiJePhmVP3ajCs5edm_OEg-1; Wed, 30 Nov 2022 14:27:00 -0500
X-MC-Unique: iiJePhmVP3ajCs5edm_OEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90EF6827982;
	Wed, 30 Nov 2022 19:26:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22E774EA4B;
	Wed, 30 Nov 2022 19:26:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E442519465A4;
	Wed, 30 Nov 2022 19:26:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39D5D1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Nov 2022 18:50:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C55A040C6E15; Wed, 30 Nov 2022 18:50:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA0240C6EC4
 for <linux-cachefs@redhat.com>; Wed, 30 Nov 2022 18:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A137586F129
 for <linux-cachefs@redhat.com>; Wed, 30 Nov 2022 18:50:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-ql1uv0cENkOH1Onz_C0_HQ-1; Wed, 30 Nov 2022 13:50:19 -0500
X-MC-Unique: ql1uv0cENkOH1Onz_C0_HQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFA9B61D73;
 Wed, 30 Nov 2022 18:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8531C433C1;
 Wed, 30 Nov 2022 18:50:17 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Date: Wed, 30 Nov 2022 19:22:10 +0100
Message-Id: <20221130180547.424547936@linuxfoundation.org>
In-Reply-To: <20221130180544.105550592@linuxfoundation.org>
References: <20221130180544.105550592@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH 6.0 145/289] fscache: fix OOB Read in
 __fscache_acquire_volume
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Layton <jlayton@kernel.org>,
 patches@lists.linux.dev, syzbot+a76f6a6e524cf2080aa3@syzkaller.appspotmail.com,
 linux-cachefs@redhat.com, Zhang Peng <zhangpeng362@huawei.com>,
 v9fs-developer@lists.sourceforge.net,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Howells <dhowells@redhat.com>

[ Upstream commit 9f0933ac026f7e54fe096797af9de20724e79097 ]

The type of a->key[0] is char in fscache_volume_same().  If the length
of cache volume key is greater than 127, the value of a->key[0] is less
than 0.  In this case, klen becomes much larger than 255 after type
conversion, because the type of klen is size_t.  As a result, memcmp()
is read out of bounds.

This causes a slab-out-of-bounds Read in __fscache_acquire_volume(), as
reported by Syzbot.

Fix this by changing the type of the stored key to "u8 *" rather than
"char *" (it isn't a simple string anyway).  Also put in a check that
the volume name doesn't exceed NAME_MAX.

  BUG: KASAN: slab-out-of-bounds in memcmp+0x16f/0x1c0 lib/string.c:757
  Read of size 8 at addr ffff888016f3aa90 by task syz-executor344/3613
  Call Trace:
   memcmp+0x16f/0x1c0 lib/string.c:757
   memcmp include/linux/fortify-string.h:420 [inline]
   fscache_volume_same fs/fscache/volume.c:133 [inline]
   fscache_hash_volume fs/fscache/volume.c:171 [inline]
   __fscache_acquire_volume+0x76c/0x1080 fs/fscache/volume.c:328
   fscache_acquire_volume include/linux/fscache.h:204 [inline]
   v9fs_cache_session_get_cookie+0x143/0x240 fs/9p/cache.c:34
   v9fs_session_init+0x1166/0x1810 fs/9p/v9fs.c:473
   v9fs_mount+0xba/0xc90 fs/9p/vfs_super.c:126
   legacy_get_tree+0x105/0x220 fs/fs_context.c:610
   vfs_get_tree+0x89/0x2f0 fs/super.c:1530
   do_new_mount fs/namespace.c:3040 [inline]
   path_mount+0x1326/0x1e20 fs/namespace.c:3370
   do_mount fs/namespace.c:3383 [inline]
   __do_sys_mount fs/namespace.c:3591 [inline]
   __se_sys_mount fs/namespace.c:3568 [inline]
   __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568

Fixes: 62ab63352350 ("fscache: Implement volume registration")
Reported-by: syzbot+a76f6a6e524cf2080aa3@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Zhang Peng <zhangpeng362@huawei.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Jeff Layton <jlayton@kernel.org>
cc: v9fs-developer@lists.sourceforge.net
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/Y3OH+Dmi0QIOK18n@codewreck.org/ # Zhang Peng's v1 fix
Link: https://lore.kernel.org/r/20221115140447.2971680-1-zhangpeng362@huawei.com/ # Zhang Peng's v2 fix
Link: https://lore.kernel.org/r/166869954095.3793579.8500020902371015443.stgit@warthog.procyon.org.uk/ # v1
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/fscache/volume.c     | 7 +++++--
 include/linux/fscache.h | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index a058e0136bfe..ab8ceddf9efa 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -203,7 +203,11 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	struct fscache_volume *volume;
 	struct fscache_cache *cache;
 	size_t klen, hlen;
-	char *key;
+	u8 *key;
+
+	klen = strlen(volume_key);
+	if (klen > NAME_MAX)
+		return NULL;
 
 	if (!coherency_data)
 		coherency_len = 0;
@@ -229,7 +233,6 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	/* Stick the length on the front of the key and pad it out to make
 	 * hashing easier.
 	 */
-	klen = strlen(volume_key);
 	hlen = round_up(1 + klen + 1, sizeof(__le32));
 	key = kzalloc(hlen, GFP_KERNEL);
 	if (!key)
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 36e5dd84cf59..8e312c8323a8 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -75,7 +75,7 @@ struct fscache_volume {
 	atomic_t			n_accesses;	/* Number of cache accesses in progress */
 	unsigned int			debug_id;
 	unsigned int			key_hash;	/* Hash of key string */
-	char				*key;		/* Volume ID, eg. "afs@example.com@1234" */
+	u8				*key;		/* Volume ID, eg. "afs@example.com@1234" */
 	struct list_head		proc_link;	/* Link in /proc/fs/fscache/volumes */
 	struct hlist_bl_node		hash_link;	/* Link in hash table */
 	struct work_struct		work;
-- 
2.35.1



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

