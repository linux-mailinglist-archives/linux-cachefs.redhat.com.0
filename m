Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE0A3473F1
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Mar 2021 09:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616575885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uvhXQ4NuS36qRJyxtB6F71mv9qEo3LN8ON8FjyHmDOo=;
	b=ZCKxqdZKV1VVQDMF+4ht6XKGK9IA2eKSr7LbUsqPiccNtDlge1H6BJ/SfDFj6OJgYmpEWX
	mTxevjfRFsYIdgT6A0TpragE0TuSmFJ4VZqlP3hnRF29VnpZ4RK+05KblPoQK199KP3Nsy
	BieMeAyNjT4V6Yjwyn0OMUlZJI2h7xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-XcGv7-ibOrKejp0niAJ3Iw-1; Wed, 24 Mar 2021 04:51:23 -0400
X-MC-Unique: XcGv7-ibOrKejp0niAJ3Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A77B881287;
	Wed, 24 Mar 2021 08:51:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D211007606;
	Wed, 24 Mar 2021 08:51:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 588E14BB7C;
	Wed, 24 Mar 2021 08:51:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O8pG9L016950 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 04:51:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 136392A2CB; Wed, 24 Mar 2021 08:51:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B00A25D9DE;
	Wed, 24 Mar 2021 08:51:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Wed, 24 Mar 2021 08:51:10 +0000
Message-ID: <161657587086.2876766.8721792351947204187.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

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

Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/lkml/20210303161528.n3jzg66ou2wa43qb@wittgenstein [1]
Link: https://lore.kernel.org/r/20210316112257.2974212-1-christian.brauner@ubuntu.com/ # v1
Link: https://listman.redhat.com/archives/linux-cachefs/2021-March/msg00044.html # v2
Link: https://lore.kernel.org/r/20210319114146.410329-1-christian.brauner@ubuntu.com/ # v3
---

 fs/cachefiles/bind.c |    6 ++++++
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


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

