Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0380235F3F6
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:39:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-6Y51gqWnOYqTKnqfXu4Mlg-1; Wed, 14 Apr 2021 08:39:10 -0400
X-MC-Unique: 6Y51gqWnOYqTKnqfXu4Mlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC4C4DF8A4;
	Wed, 14 Apr 2021 12:39:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D601899A;
	Wed, 14 Apr 2021 12:39:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A022944A5E;
	Wed, 14 Apr 2021 12:39:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECd5wN018101 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:39:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DE83E30BF; Wed, 14 Apr 2021 12:39:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37D9DE2053
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:39:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A949185A7A7
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:39:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-181-FlBs6GFYNjWTso-aprpBWA-1;
	Wed, 14 Apr 2021 08:38:54 -0400
X-MC-Unique: FlBs6GFYNjWTso-aprpBWA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EBBE6121E;
	Wed, 14 Apr 2021 12:38:49 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:49 +0200
Message-Id: <20210414123750.2110159-6-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=sq3ZzJvntlYHpVF9DUkagn5nQ3VlfP9ykb05/pqtBDE=;
	m=pMjwapyIHPZh2/jZFihhcFe5DK1wUmIATDV/mlaE9cQ=;
	p=kPx7pu4bz6rCME+mwYTdOpwBCcQFbCJKRgNcEqqGPKo=;
	g=32bd3995c45960364db8a408beff14ea96e10a5d
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh3wAKCRCRxhvAZXjcoqmsAP9WTRL
	HhgjsPj1vt/opz4ujzq/rvgDD88VfrmOjH9S5PwEAwVoUUC1QG5rJugyGy51+fWaZql9taVGW7gR4
	6svLOwA=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECd5wN018101
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 5/7] cachefiles: extend ro check to private
	mount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

So far cachefiles only verified that the superblock wasn't read-only but
didn't check whether the mount was. This made sense when we did not use
a private mount because the read-only state could change at any point.

Now that we have a private mount and mount properties can't change
behind our back extend the read-only check to include the vfsmount.

The __mnt_is_readonly() helper will check both the mount and the
superblock.  Note that before we checked root->d_sb and now we check
mnt->mnt_sb but since we have a matching <vfsmount, dentry> pair here
this is only syntactical change, not a semantic one.

Here's how this works:

mount -o ro --bind /var/cache/fscache/ /var/cache/fscache/

systemctl start cachefilesd
  Job for cachefilesd.service failed because the control process exited with error code.
  See "systemctl status cachefilesd.service" and "journalctl -xe" for details.

dmesg | grep CacheFiles
  [    2.922514] CacheFiles: Loaded
  [  272.206907] CacheFiles: Failed to register: -30

errno 30
  EROFS 30 Read-only file system

Cc: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/cachefiles/bind.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index 7ef572d698f0..8cf283de4e14 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -141,8 +141,13 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	    !root->d_sb->s_op->sync_fs)
 		goto error_unsupported;
 
+	/*
+	 * Verify our mount and superblock aren't read-only.
+	 * Note, while our private mount is guaranteed to not change anymore
+	 * the superblock may still go read-only later.
+	 */
 	ret = -EROFS;
-	if (sb_rdonly(root->d_sb))
+	if (__mnt_is_readonly(cache->mnt))
 		goto error_unsupported;
 
 	/* determine the security of the on-disk cache as this governs
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

