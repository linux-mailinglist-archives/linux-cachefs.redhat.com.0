Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06B5A842C
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Aug 2022 19:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661966521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Ue511vpjMaEKLC1tiBl4cty7+3Gxr/zzIToMe32agg=;
	b=DoaGZ2KNbfdhTGa3BSCcSTdJ2jxvi9LOh/fkVGF72BBqWUHwugqo7IPsTTLse5ywrTjsxv
	acbdrwiK9g38SgbqNYaB4E9sYRvOBZ52VggbrAcFboH4eETrnIVWAp064m8gK8cjzuMxKc
	+Rv31TkLxw+6i49FLnAIzFt6J3OkKpE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-jshPdNS9Pa2QRrQVZVlA6Q-1; Wed, 31 Aug 2022 13:21:57 -0400
X-MC-Unique: jshPdNS9Pa2QRrQVZVlA6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18FA196408B;
	Wed, 31 Aug 2022 17:21:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DE2CC15BBA;
	Wed, 31 Aug 2022 17:21:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7E201946A4D;
	Wed, 31 Aug 2022 17:21:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B8041946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 16:14:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B98F2026D07; Wed, 31 Aug 2022 16:14:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C28A2026D4C;
 Wed, 31 Aug 2022 16:14:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Wed, 31 Aug 2022 17:14:39 +0100
Message-ID: <1867371.1661962479@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [GIT PULL] fscache, cachefiles: Miscellaneous fixes
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
Cc: Khalid Masum <khalid.masum.92@gmail.com>, linux-fsdevel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, Yongqing Li <liyongqing@bytedance.com>,
 linux-cachefs@redhat.com, Sun Ke <sunke32@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1867370.1661962479.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Here's a collection of fixes for fscache and cachefiles, if you could pull
them:

 (1) Fix kdoc on fscache_use/unuse_cookie().

 (2) Fix the error returned by cachefiles_ondemand_copen() from an upcall
     result.

 (3) Fix the distribution of requests in on-demand mode in cachefiles to be
     fairer by cycling through them rather than picking the one with the
     lowest ID each time (IDs being reused).

David
---
The following changes since commit b90cb1053190353cc30f0fef0ef1f378ccc063c5:

  Linux 6.0-rc3 (2022-08-28 15:05:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220831

for you to fetch changes up to 1122f40072731525c06b1371cfa30112b9b54d27:

  cachefiles: make on-demand request distribution fairer (2022-08-31 16:41:10 +0100)

----------------------------------------------------------------
fscache/cachefiles fixes

----------------------------------------------------------------
Khalid Masum (1):
      fscache: fix misdocumented parameter

Sun Ke (1):
      cachefiles: fix error return code in cachefiles_ondemand_copen()

Xin Yin (1):
      cachefiles: make on-demand request distribution fairer

 fs/cachefiles/internal.h |  1 +
 fs/cachefiles/ondemand.c | 22 ++++++++++++++++------
 include/linux/fscache.h  |  4 ++--
 3 files changed, 19 insertions(+), 8 deletions(-)
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

