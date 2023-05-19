Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D7709DD1
	for <lists+linux-cachefs@lfdr.de>; Fri, 19 May 2023 19:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684516887;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iCrovS/Z/SiMkxQmwaLg97Bp27m/51F4G06dTEnwjqE=;
	b=OaS/nkwHBqzK0arXKv+SGB+rm83pDpLpWQs9voHyF9EUTuazHgJd3/Hfwv/eLM5EIEHKW8
	XDvJ9JyRhXQ99befGYb8OqIzQhSpjnKa5xNhjXIO6Z7SvIlyMN6gHoZD81MHwMfo1q/0uU
	K/zYPQti5vL7ym+Gb96a4tiw/uhWZN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-q-_6ZJeSNMGT3n_BHNxtSA-1; Fri, 19 May 2023 13:21:25 -0400
X-MC-Unique: q-_6ZJeSNMGT3n_BHNxtSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A5F85A5BE;
	Fri, 19 May 2023 17:21:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C8EC2166B27;
	Fri, 19 May 2023 17:21:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 12F2219465B7;
	Fri, 19 May 2023 17:21:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C719619465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 19 May 2023 17:21:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72A8D40D1B61; Fri, 19 May 2023 17:21:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3C640D1B60;
 Fri, 19 May 2023 17:21:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Fri, 19 May 2023 18:21:20 +0100
Message-ID: <1853230.1684516880@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH] cachefiles: Allow the cache to be non-root
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
Cc: linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1853229.1684516880.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    
Set mode 0600 on files in the cache so that cachefilesd can run as an
unprivileged user rather than leaving the files all with 0.  Directories
are already set to 0700.

Userspace then needs to set the uid and gid before issuing the "bind"
command and the cache must've been chown'd to those IDs.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/cachefiles/namei.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 82219a8f6084..66482c193e86 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -451,7 +451,8 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
 
 	ret = cachefiles_inject_write_error();
 	if (ret == 0) {
-		file = vfs_tmpfile_open(&nop_mnt_idmap, &parentpath, S_IFREG,
+		file = vfs_tmpfile_open(&nop_mnt_idmap, &parentpath,
+					S_IFREG | 0600,
 					O_RDWR | O_LARGEFILE | O_DIRECT,
 					cache->cache_cred);
 		ret = PTR_ERR_OR_ZERO(file);
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

