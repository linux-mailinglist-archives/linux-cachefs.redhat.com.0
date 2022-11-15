Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3479A62A3DD
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Nov 2022 22:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668547179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K8/75oLDCIGUXopejMbVzdtlesqQ1fjmn+iD1UxQuto=;
	b=hVZE6xCKsP9dzLXgWjhSzunAUvSajf8/3S0JXxqheI6VFXiDnQilOATY4ljVKyL+DHVDfs
	+/rosXZRZcfzN0d7GFnwqO6sOg5WMxbd1KQ8tfRZOSlB52CmU6sCtmNQclww13DSygeWXi
	l8zqAt4Dp4Lhk50tPlGiQW07qHnRSsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-5ZPyTycaMfWUf-Vs7k03YQ-1; Tue, 15 Nov 2022 16:19:36 -0500
X-MC-Unique: 5ZPyTycaMfWUf-Vs7k03YQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52BEE8339B4;
	Tue, 15 Nov 2022 21:19:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D935A492B05;
	Tue, 15 Nov 2022 21:19:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96A2D19465A3;
	Tue, 15 Nov 2022 21:19:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D02921946597 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 21:19:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E8B01121325; Tue, 15 Nov 2022 21:19:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A0A112131E;
 Tue, 15 Nov 2022 21:19:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: torvalds@linux-foundation.org
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
Date: Tue, 15 Nov 2022 21:19:29 +0000
Message-ID: <1846994.1668547169@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Linux-cachefs] [GIT PULL] netfs: Fix folio unmarking/unlocking
 loops
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
 willy@infradead.org, linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1846965.1668547152.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you pull these changes please?  There are two, affecting the
functions that iterates over the pagecache unmarking or unlocking pages
after an op is complete:

 (1) xas_for_each() loops must call xas_retry() first thing and immediately
     do a "continue" in the case that the extracted value is a special
     value that indicates that the walk raced with a modification.  Fix the
     unlock and unmark loops to do this.

 (2) The maths in the unlock loop is dodgy as it could, theoretically, at
     some point in the future end up with a starting file pointer that is
     in the middle of a folio.  This will cause a subtraction to go
     negative - but the number is unsigned.  Fix the maths to use absolute
     file positions instead of relative page indices.

Thanks,
David

Link: https://lore.kernel.org/r/166749229733.107206.17482609105741691452.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk/ # v2
---
The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-fixes-20221115

for you to fetch changes up to 5e51c627c5acbcf82bb552e17533a79d2a6a2600:

  netfs: Fix dodgy maths (2022-11-15 16:56:07 +0000)

----------------------------------------------------------------
netfslib fixes

----------------------------------------------------------------
David Howells (2):
      netfs: Fix missing xas_retry() calls in xarray iteration
      netfs: Fix dodgy maths

 fs/netfs/buffered_read.c | 20 +++++++++++++-------
 fs/netfs/io.c            |  3 +++
 2 files changed, 16 insertions(+), 7 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

