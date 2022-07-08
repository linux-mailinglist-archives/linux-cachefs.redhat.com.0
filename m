Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1C56C17C
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Jul 2022 23:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657315963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zS4QuGET3yvrZIhsbvxUtn8wNGPxH3luW+3gLuSoXxo=;
	b=HK6g7nSsmdMuxPgDFpHL464/GuJeruoYeIHD2rKh2UXdltd01TtaMMiCfhOSaTlSvb3ViA
	cSQ3J0iLexp++KwA1AfrLy2LuxvKO1JfFI25fKrQ5Zzyfn9mMqR4eIjWZtQlvu3G/wm4B2
	N+U832HeWbZEYfNWeJT/8wR+gJ9KqD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-DD-GIZQ3ObuS7_Z52Tsqgg-1; Fri, 08 Jul 2022 17:32:41 -0400
X-MC-Unique: DD-GIZQ3ObuS7_Z52Tsqgg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47337803520;
	Fri,  8 Jul 2022 21:32:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B3F2492C3B;
	Fri,  8 Jul 2022 21:32:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 301041947076;
	Fri,  8 Jul 2022 21:32:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABEB6194706C for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Jul 2022 21:32:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C3A140D2831; Fri,  8 Jul 2022 21:32:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E1C540D282E;
 Fri,  8 Jul 2022 21:32:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Fri, 08 Jul 2022 22:32:31 +0100
Message-ID: <3753787.1657315951@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Jia Zhu <zhujia.zj@bytedance.com>, linux-cachefs@redhat.com,
 Max Kellermann <mk@cm4all.com>, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Yue Hu <huyue2@coolpad.com>, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3753786.1657315951.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you pull these fscache/cachefiles fixes please?

 (1) Fix a check in fscache_wait_on_volume_collision() in which the
     polarity is reversed.  It should complain if a volume is still marked
     acquisition-pending after 20s, but instead complains if the mark has
     been cleared (ie. the condition has cleared).

     Also switch an open-coded test of the ACQUIRE_PENDING volume flag to
     use the helper function for consistency.

 (2) Not a fix per se, but neaten the code by using a helper to check for
     the DROPPED state.

 (3) Fix cachefiles's support for erofs to only flush requests associated
     with a released control file, not all requests.

 (4) Fix a race between one process invalidating an object in the cache and
     another process trying to look it up.

Thanks,
David
---
The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220708

for you to fetch changes up to 85e4ea1049c70fb99de5c6057e835d151fb647da:

  fscache: Fix invalidation/lookup race (2022-07-05 16:12:55 +0100)

----------------------------------------------------------------
fscache fixes

----------------------------------------------------------------
David Howells (1):
      fscache: Fix invalidation/lookup race

Jia Zhu (1):
      cachefiles: narrow the scope of flushed requests when releasing fd

Yue Hu (2):
      fscache: Fix if condition in fscache_wait_on_volume_collision()
      fscache: Introduce fscache_cookie_is_dropped()

 fs/cachefiles/ondemand.c |  3 ++-
 fs/fscache/cookie.c      | 26 ++++++++++++++++++++++----
 fs/fscache/volume.c      |  4 ++--
 include/linux/fscache.h  |  1 +
 4 files changed, 27 insertions(+), 7 deletions(-)
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

