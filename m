Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7C4F9FDB
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Apr 2022 01:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649459168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=//ZuaKpKZ0FIn9qp/yRK+cDrxXbLXsd781n6EToecdo=;
	b=cbK8U9ppH71BEHaoBKBD1O5Mf3CKPkin3O45lrnTCIewuwqxH1v10r/RGdA2h7uOjkCyxL
	FYmBvWTS7Be5pHAMU2oOW9PS9T0TGd6QnoJap9Ucvpw8c5Jy3T/htziJX4iHr8Mvhek6sD
	KlZmew3IF2mF7BNZDANEJg+CWw1MTpU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-wl6oCegEMXifOqd25C51pg-1; Fri, 08 Apr 2022 19:06:07 -0400
X-MC-Unique: wl6oCegEMXifOqd25C51pg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF38985A5BC;
	Fri,  8 Apr 2022 23:06:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC2291410F3B;
	Fri,  8 Apr 2022 23:06:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78E52194034A;
	Fri,  8 Apr 2022 23:06:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D630D1940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 23:06:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C58DF2166BB1; Fri,  8 Apr 2022 23:06:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA3B2167D60;
 Fri,  8 Apr 2022 23:05:57 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Sat, 09 Apr 2022 00:05:56 +0100
Message-ID: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [RFC][PATCH 0/8] fscache, cachefiles: Fixes
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Yue Hu <huyue2@coolpad.com>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here's a collection of fscache and cachefiles fixes and misc small
cleanups.  The two main fixes are:

 (1) Add a missing unmark of the inode in-use mark in an error path.

 (2) Fix a KASAN slab-out-of-bounds error when setting the xattr on a
     cachefiles volume due to the wrong length being given to memcpy().

In addition, there's the removal of an unused parameter, removal of an
unused Kconfig option, conditionalising a bit of procfs-related stuff and
some doc fixes.

The patches are on a branch here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-fixes

David

---
Dave Wysochanski (1):
      cachefiles: Fix KASAN slab-out-of-bounds in cachefiles_set_volume_xattr

Jeffle Xu (1):
      cachefiles: unmark inode in use in error path

Yue Hu (6):
      docs: filesystems: caching/backend-api.rst: correct two relinquish APIs use
      docs: filesystems: caching/backend-api.rst: fix an object withdrawn API
      fscache: Remove the cookie parameter from fscache_clear_page_bits()
      fscache: Move fscache_cookies_seq_ops specific code under CONFIG_PROC_FS
      fscache: Use wrapper fscache_set_cache_state() directly when relinquishing
      fscache: remove FSCACHE_OLD_API Kconfig option


 .../filesystems/caching/backend-api.rst       |  8 ++---
 .../filesystems/caching/netfs-api.rst         | 25 +++++++-------
 fs/afs/write.c                                |  3 +-
 fs/cachefiles/namei.c                         | 33 ++++++++++++++-----
 fs/cachefiles/xattr.c                         |  2 +-
 fs/fscache/Kconfig                            |  3 --
 fs/fscache/cache.c                            |  2 +-
 fs/fscache/cookie.c                           |  4 ++-
 fs/fscache/internal.h                         |  4 +++
 fs/fscache/io.c                               |  5 ++-
 include/linux/fscache.h                       |  4 +--
 11 files changed, 53 insertions(+), 40 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

