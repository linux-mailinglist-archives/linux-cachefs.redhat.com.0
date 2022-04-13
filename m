Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1AD4FFA5A
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Apr 2022 17:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649864164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Ax4TAK8wSZfjfqFDXExEYEzzKwXQp9VK6mU9dew8ng=;
	b=RFwaIIM/Dq7ZoAssHYjps6hvknWKL/dWrduFl4s00lwTyPZQNvagm6QdyR1Hl0tt4Fqc7t
	Y1JCWVGuWE7MMYqGr9QmwRHJ5nubENsu/6r0zHskCb+uvL0y/D4klDdN7wxQFrj1qzih7y
	yvxjywD7iTVYz/eiiz3lECWn8IHLBz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-gZAfjFLCNXukVrM5VQMPag-1; Wed, 13 Apr 2022 11:36:01 -0400
X-MC-Unique: gZAfjFLCNXukVrM5VQMPag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3961385A5BC;
	Wed, 13 Apr 2022 15:36:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1489C27E9D;
	Wed, 13 Apr 2022 15:35:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A7151940373;
	Wed, 13 Apr 2022 15:35:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 70C4D1940340 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 13 Apr 2022 15:35:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FA94C27EA8; Wed, 13 Apr 2022 15:35:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED7AC27E9D;
 Wed, 13 Apr 2022 15:34:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Wed, 13 Apr 2022 16:34:57 +0100
Message-ID: <2266868.1649864097@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [GIT PULL] fscache: Miscellaneous fixes
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
Cc: linux-cachefs@redhat.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Yue Hu <huyue2@coolpad.com>, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2266867.1649864097.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Here's a collection of fscache and cachefiles fixes and misc small
cleanups.  The two main fixes are:

 (1) Add a missing unmark of the inode in-use mark in an error path.

 (2) Fix a KASAN slab-out-of-bounds error when setting the xattr on a
     cachefiles volume due to the wrong length being given to memcpy().

In addition, there's the removal of an unused parameter, removal of an
unused Kconfig option, conditionalising a bit of procfs-related stuff and
some doc fixes.

David

Link: https://lore.kernel.org/r/164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk/

---
The following changes since commit 42e7a03d3badebd4e70aea5362d6914dfc7c220b:

  Merge tag 'hyperv-fixes-signed-20220407' of git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux (2022-04-07 06:35:34 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220413

for you to fetch changes up to 61132ceeda723d2c48cbc2610ca3213a7fcb083b:

  fscache: remove FSCACHE_OLD_API Kconfig option (2022-04-08 23:54:37 +0100)

----------------------------------------------------------------
fscache fixes

----------------------------------------------------------------
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

 Documentation/filesystems/caching/backend-api.rst |  8 +++---
 Documentation/filesystems/caching/netfs-api.rst   | 25 +++++++++--------
 fs/afs/write.c                                    |  3 +--
 fs/cachefiles/namei.c                             | 33 ++++++++++++++++-------
 fs/cachefiles/xattr.c                             |  2 +-
 fs/fscache/Kconfig                                |  3 ---
 fs/fscache/cache.c                                |  2 +-
 fs/fscache/cookie.c                               |  4 ++-
 fs/fscache/internal.h                             |  4 +++
 fs/fscache/io.c                                   |  5 ++--
 include/linux/fscache.h                           |  4 +--
 11 files changed, 53 insertions(+), 40 deletions(-)
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

