Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF2F5341BAA
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 Mar 2021 12:42:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-LbS0JLNfM2GuxTmCgPG5Cg-1; Fri, 19 Mar 2021 07:42:24 -0400
X-MC-Unique: LbS0JLNfM2GuxTmCgPG5Cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC8B583DD25;
	Fri, 19 Mar 2021 11:42:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE5305D9C6;
	Fri, 19 Mar 2021 11:42:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 302DD4BB7C;
	Fri, 19 Mar 2021 11:42:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JBgDqb004401 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 07:42:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7153FC731; Fri, 19 Mar 2021 11:42:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1259FDCE2
	for <linux-cachefs@redhat.com>; Fri, 19 Mar 2021 11:42:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B424D85A5B5
	for <linux-cachefs@redhat.com>; Fri, 19 Mar 2021 11:42:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-CjUpZfh1Md6jdp6x-jlEjg-1; Fri, 19 Mar 2021 07:42:02 -0400
X-MC-Unique: CjUpZfh1Md6jdp6x-jlEjg-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1lNDVx-0006Mu-0N; Fri, 19 Mar 2021 11:42:01 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Fri, 19 Mar 2021 12:41:47 +0100
Message-Id: <20210319114146.410329-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [Linux-cachefs] [PATCH v3] cachefiles: do not yet allow on idmapped
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Based on discussions (e.g. in [1]) my understanding of cachefiles and
the cachefiles userspace daemon is that it creates a cache on a local
filesystem (e.g. ext4, xfs etc.) for a network filesystem. The way this
is done is by writing "bind" to /dev/cachefiles and pointing it to the
directory to use as the cache.
Currently this directory can technically also be an idmapped mount but
cachefiles aren't yet fully aware of such mounts and thus don't take the
idmapping into account when creating cache entries. This could leave
users confused as the ownership of the files wouldn't match to what they
expressed in the idmapping. Block cache files on idmapped mounts until
the fscache rework is done and we have ported it to support idmapped
mounts.

[1]: https://lore.kernel.org/lkml/20210303161528.n3jzg66ou2wa43qb@wittgenstein
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
- Christian Brauner <christian.brauner@ubuntu.com>:
  - Ensure that "root" is initialized when cleaning up.

/* v3 */
- David Howells <dhowells@redhat.com>:
  - Reformulate commit message to avoid paragraphs with duplicated
    content.
  - Add a pr_warn() when cachefiles are supposed to be created on
    idmapped mounts.
---
 fs/cachefiles/bind.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index dfb14dbddf51..38bb7764b454 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -118,6 +118,12 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
 	cache->mnt = path.mnt;
 	root = path.dentry;
 
+	ret = -EINVAL;
+	if (mnt_user_ns(path.mnt) != &init_user_ns) {
+		pr_warn("File cache on idmapped mounts not supported");
+		goto error_unsupported;
+	}
+
 	/* check parameters */
 	ret = -EOPNOTSUPP;
 	if (d_is_negative(root) ||

base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

