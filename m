Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A93CD33D7AE
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Mar 2021 16:35:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-5oIRy4YOPFS8SzPtdW2jIg-1; Tue, 16 Mar 2021 11:35:00 -0400
X-MC-Unique: 5oIRy4YOPFS8SzPtdW2jIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF75801817;
	Tue, 16 Mar 2021 15:34:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2C0360C0F;
	Tue, 16 Mar 2021 15:34:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9955E57DC3;
	Tue, 16 Mar 2021 15:34:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GBdF0l023099 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 07:39:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE9202157F25; Tue, 16 Mar 2021 11:39:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C91012157F24
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 11:39:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C7E3185A7BA
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 11:39:13 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-145-b7x1WY97NrCugaF_g0zawQ-1; Tue, 16 Mar 2021 07:39:11 -0400
X-MC-Unique: b7x1WY97NrCugaF_g0zawQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1lM7n0-0006XY-2K; Tue, 16 Mar 2021 11:23:06 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Tue, 16 Mar 2021 12:22:57 +0100
Message-Id: <20210316112257.2974212-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
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
X-Mailman-Approved-At: Tue, 16 Mar 2021 11:34:53 -0400
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [Linux-cachefs] [PATCH] cachefiles: do not yet allow on idmapped
	mounts
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Based on discussion with David Howells my understanding of cachefiles
and the cachefiles userspace daemon is that it creates a cache on a
local filesystem (e.g. ext4, xfs etc.) for a network filesystem. The way
this is done is by writing "bind" to /dev/cachefiles and pointing it to
the directory to use as the cache.
So from our offline discussion I gather that cachefilesd creates a cache
on a local filesystem (ext4, xfs etc.) for a network filesystem. The way
this is done is by writing "bind" to /dev/cachefiles and pointing it to
a directory to use as the cache.
Currently this directory can technically also be an idmapped mount but
cachefiles aren't yet fully aware of such mounts and thus don't take the
idmapping into account. This could leave users confused as the ownership
of the files wouldn't match to what they expressed in the idmapping. So
let's not allow this for now and only make cachefiles aware of idmapped
mounts after it's current rewrite/rework is done.

Link: https://lore.kernel.org/lkml/20210303161528.n3jzg66ou2wa43qb@wittgenstein
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/cachefiles/bind.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index dfb14dbddf51..bd7eab9a0539 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -115,6 +115,10 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	if (ret < 0)
 		goto error_open_root;
 
+	ret = -EINVAL;
+	if (mnt_user_ns(path.mnt) != &init_user_ns)
+		goto error_unsupported;
+
 	cache->mnt = path.mnt;
 	root = path.dentry;
 

base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

