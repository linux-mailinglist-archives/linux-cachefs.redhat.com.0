Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6582C62B9C6
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Nov 2022 11:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668595522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DDf9fWAXwkvdI1w3qtq81W9NGdQeLsLLQ+E5Tpy6Leg=;
	b=ekqcwbsLUn4wXnQFTRI4MBL/AfYiK3ukuUmXMYV48DWE7k782qaDyV1L0UNr4iVqHukrTL
	XtzVXC6nHI7aStSxYxhMjVrNYzA+ajyTIFTHeYcVZPIu7+H3F6lIFPQMHzw++rqsxvTgNV
	aWkYsuIj2ng4hdrhdmHvlDCEF4wd1z8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-5H75XZHbObeyq66IOdgghA-1; Wed, 16 Nov 2022 05:45:18 -0500
X-MC-Unique: 5H75XZHbObeyq66IOdgghA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5191D185A78F;
	Wed, 16 Nov 2022 10:45:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 569BB40C6EC3;
	Wed, 16 Nov 2022 10:45:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11E7119465B1;
	Wed, 16 Nov 2022 10:45:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4CB3619465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Nov 2022 10:45:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C75A40E978A; Wed, 16 Nov 2022 10:45:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2570540E9789
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 10:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 083273C0F240
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 10:45:13 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-503-36R1Z1OoO--4A4J5qAAx6Q-1; Wed, 16 Nov 2022 05:45:08 -0500
X-MC-Unique: 36R1Z1OoO--4A4J5qAAx6Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VUxXL9z_1668595503
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VUxXL9z_1668595503) by smtp.aliyun-inc.com;
 Wed, 16 Nov 2022 18:45:05 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: xiang@kernel.org, chao@kernel.org, jlayton@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com, dhowells@redhat.com
Date: Wed, 16 Nov 2022 18:45:00 +0800
Message-Id: <20221116104502.107431-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v3 0/2] fscache,
 cachefiles: add prepare_ondemand_read() interface
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v3:
- rebase to v6.1-rc5, while the xas_retry() checking in patch 2 has
  been extracted out as a separate fix [1]

[1] commit 37020bbb71d9 ("erofs: fix missing xas_retry() in fscache mode")
(https://github.com/torvalds/linux/commit/37020bbb71d9)


v2:
- patch 1: the generic routine, i.e. cachefiles_do_prepare_read() now
  accepts a parameter list instead of netfs_io_subrequest, and thus some
  debug info retrieved from netfs_io_subrequest is removed from
  trace_cachefiles_prep_read().
- patch 2: add xas_retry() checking in erofs_fscache_req_complete()


[Rationale]
===========
Fscache has been landed as a generic caching management framework in
the Linux kernel for decades.  It aims to manage cache data availability
or fetch data if needed.  Currently it's mainly used for network fses,
but in principle the main caching subsystem can be used more widely.

We do really like fscache framework and we believe it'd be better to
reuse such framework if possible instead of duplicating other
alternatives for better maintenance and testing.  Therefore for our
container image use cases, we applied the existing fscache to implement
on-demand read for erofs in the past months.  For more details, also see
[1].

In short, here each erofs filesystem is composed of multiple blobs (or
devices).  Each blob corresponds to one fscache cookie to strictly
follow on-disk format and implement the image downloading in a
deterministic manner, which means it has a unique checksum and is signed
by vendors.

Data of each erofs inode can be scattered among multiple blobs (cookie)
since erofs supports chunk-level deduplication.  In this case, each
erofs inode can correspond to multiple cookies, and there's a logical to
physical offset mapping between the logical offset in erofs inode and
the physical offset in the backing file.

As described above, per-cookie netfs model can not be used here
directly.  Instead, we'd like to propose/decouple a simple set of raw
fscache APIs, to access cache for all fses to use.  We believe it's
useful since it's like the relationship between raw bio and iomap, both
of which are useful for local fses.  fscache_read() seems a reasonable
candidate and is enough for such use case.

In addition, the on-demand read feature relies on .prepare_read() to
reuse the hole detecting logic as much as possible. However, after
fscache/netfs rework, libnetfs is preferred to access fscache, making
.prepare_read() closely coupled with libnetfs, or more precisely,
netfs_io_subrequest.


[What We Do]
============
As we discussed previously, we propose a new interface, i,e,
.prepare_ondemand_read() dedicated for the on-demand read scenarios,
which is independent on netfs_io_subrequest. The netfs will still use
the original .prepare_read() as usual.


Jingbo Xu (2):
  fscache,cachefiles: add prepare_ondemand_read() callback
  erofs: switch to prepare_ondemand_read() in fscache mode

 fs/cachefiles/io.c                |  75 +++++----
 fs/erofs/fscache.c                | 259 +++++++++++-------------------
 include/linux/netfs.h             |   7 +
 include/trace/events/cachefiles.h |  27 ++--
 4 files changed, 160 insertions(+), 208 deletions(-)

-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

