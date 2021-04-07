Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 69ED5356791
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 11:02:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-3mNW0IQPObuz8bTf2l5NPw-1; Wed, 07 Apr 2021 05:02:44 -0400
X-MC-Unique: 3mNW0IQPObuz8bTf2l5NPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C189281744F;
	Wed,  7 Apr 2021 09:02:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9A360854;
	Wed,  7 Apr 2021 09:02:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 467191809C82;
	Wed,  7 Apr 2021 09:02:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13792cgk022454 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 05:02:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3B58111C4A2; Wed,  7 Apr 2021 09:02:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8D410073B6
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 09:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 536C6104D9A1
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 09:02:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-339-K3pW0qwwMuijgu7xtYYjSA-1;
	Wed, 07 Apr 2021 05:02:29 -0400
X-MC-Unique: K3pW0qwwMuijgu7xtYYjSA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52E5F61205;
	Wed,  7 Apr 2021 09:02:26 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed,  7 Apr 2021 11:02:08 +0200
Message-Id: <20210407090208.876920-2-brauner@kernel.org>
In-Reply-To: <20210407090208.876920-1-brauner@kernel.org>
References: <20210407090208.876920-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=sq3ZzJvntlYHpVF9DUkagn5nQ3VlfP9ykb05/pqtBDE=;
	m=pMjwapyIHPZh2/jZFihhcFe5DK1wUmIATDV/mlaE9cQ=;
	p=Uc8mMKheClJdERLiWJ7Lw09770QvIlKFHVuOwKAXN6Q=;
	g=32bd3995c45960364db8a408beff14ea96e10a5d
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYG11CQAKCRCRxhvAZXjcojjOAP93pj9
	xLL8bF12+gHx7jH9eqVIt4ed1AkDimG0Um2UzZwEA4VUIsFDUcJDSE8acwlSVAZmdnmcdMUs7CHVB
	iQG+dw8=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13792cgk022454
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [Linux-cachefs] [PATCH v2 2/2] cachefiles: extend ro check to
	private mount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
/* v2 */
patch introduced
---
 fs/cachefiles/bind.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index bbace3e51f52..cb8dd9ecc090 100644
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

