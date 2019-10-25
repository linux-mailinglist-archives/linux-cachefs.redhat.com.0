Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 46AB1E4F6A
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2019 16:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572014605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wlqoiH0WJ2e2OG2fMfHw8waPqrlsEH79eYVzgO1F2jY=;
	b=fbhg76jPguz5+Dd4XRMJOnILrHEZt1mVx9+ivXam/yEb7uKUZ2/zcN/fNZsewzCmY6HcR/
	Nte63zXKmvInCQh4bcuJj0N3InxT0nRccCDlSUonPvwkBRSHAeocdHty5OpCjRHOHADc9G
	l2y4t32CZq8afU7jdZl/XMnksZSkrHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-vUwagzpzPtuGk12uXbKPCg-1; Fri, 25 Oct 2019 10:43:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E10100551B;
	Fri, 25 Oct 2019 14:43:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6AB27987;
	Fri, 25 Oct 2019 14:43:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E41618089DC;
	Fri, 25 Oct 2019 14:43:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PCIqYs030188 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 08:18:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DEBD23DE0; Fri, 25 Oct 2019 12:18:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1A45194B6;
	Fri, 25 Oct 2019 12:18:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B64610C050B;
	Fri, 25 Oct 2019 12:18:50 +0000 (UTC)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8B21321D7B;
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Fri, 25 Oct 2019 08:18:47 -0400
Message-Id: <20191025121847.24739-3-jlayton@kernel.org>
In-Reply-To: <20191025121847.24739-1-jlayton@kernel.org>
References: <20191025121847.24739-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Fri, 25 Oct 2019 12:18:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Fri, 25 Oct 2019 12:18:50 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 10:43:01 -0400
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 3/3] cachefiles: properly clean up object
	when buffer allocation fails
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: vUwagzpzPtuGk12uXbKPCg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When cachefiles allocates objects it will do some initialization of
them, but if that initialization fails, it will just free the objects
without doing proper cleanup. At the very least, this can lead to a
cookie refcount leak.

Change the kmem_cache_free calls to properly put the objects instead.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/cachefiles/bind.c      | 3 ++-
 fs/cachefiles/interface.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
index dfb14dbddf51..22419bdf239e 100644
--- a/fs/cachefiles/bind.c
+++ b/fs/cachefiles/bind.c
@@ -242,7 +242,8 @@ static int cachefiles_daemon_add_cache(struct cachefile=
s_cache *cache)
 =09fsdef->dentry =3D NULL;
 =09dput(root);
 error_open_root:
-=09kmem_cache_free(cachefiles_object_jar, fsdef);
+=09cachefiles_cache_ops.put_object(&fsdef->fscache,
+=09=09=09=09=09fscache_obj_put_alloc_fail);
 error_root_object:
 =09cachefiles_end_secure(cache, saved_cred);
 =09pr_err("Failed to register: %d\n", ret);
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 4cea5fbf695e..955f1324b408 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -103,8 +103,8 @@ static struct fscache_object *cachefiles_alloc_object(
 =09kfree(buffer);
 nomem_buffer:
 =09BUG_ON(test_bit(CACHEFILES_OBJECT_ACTIVE, &object->flags));
-=09kmem_cache_free(cachefiles_object_jar, object);
-=09fscache_object_destroyed(&cache->cache);
+=09cachefiles_cache_ops.put_object(&object->fscache,
+=09=09=09=09=09fscache_obj_put_alloc_fail);
 nomem_object:
 =09kfree(lookup_data);
 nomem_lookup_data:
--=20
2.21.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

