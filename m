Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2417F300A88
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Jan 2021 19:01:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-XG3WHCq9P3OTzWQFIHwTqQ-1; Fri, 22 Jan 2021 13:01:56 -0500
X-MC-Unique: XG3WHCq9P3OTzWQFIHwTqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66D018C8C05;
	Fri, 22 Jan 2021 18:01:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4B456F948;
	Fri, 22 Jan 2021 18:01:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C05FA4BB7B;
	Fri, 22 Jan 2021 18:01:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MI1kOe016235 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 13:01:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 735072026D14; Fri, 22 Jan 2021 18:01:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0052026D76
	for <linux-cachefs@redhat.com>; Fri, 22 Jan 2021 18:01:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 870C6187504C
	for <linux-cachefs@redhat.com>; Fri, 22 Jan 2021 18:01:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-256-Vf1-yR_dOjix67gBLdvBGA-1;
	Fri, 22 Jan 2021 13:01:41 -0500
X-MC-Unique: Vf1-yR_dOjix67gBLdvBGA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5DFC23A79;
	Fri, 22 Jan 2021 17:51:20 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 22 Jan 2021 12:51:12 -0500
Message-Id: <20210122175119.364381-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10MI1kOe016235
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, willy@infradead.org
Subject: [Linux-cachefs] [RFC PATCH 0/6] ceph: convert buffered read
	codepaths to new netfs API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset coverts ceph to use the new netfs API that David Howells
has proposed [1]. It's a substantial reduction in code in the ceph layer
itself, but the main impetus is to allow the VM, filesystem and fscache
to better work together to optimize readahead on network filesystems.

I think the resulting code is also easier to understand, and should be
more maintainable as a lot of the pagecache handling is now done at the
netfs layer.

This has been lightly tested with xfstests. With fscache disabled, I saw
no regressions. With fscache enabled, I still hit some bugs down in the
fscache layer itself, but those seem to be present without this set as
well. This doesn't seem to make any of that worse.

[1]: https://lore.kernel.org/ceph-devel/1856291.1611259704@warthog.procyon.org.uk/T/#t

Jeff Layton (6):
  ceph: disable old fscache readpage handling
  ceph: rework PageFsCache handling
  ceph: fix invalidation
  ceph: convert readpage to fscache read helper
  ceph: plug write_begin into read helper
  ceph: convert ceph_readpages to ceph_readahead

 fs/ceph/Kconfig |   1 +
 fs/ceph/addr.c  | 536 +++++++++++++++++++-----------------------------
 fs/ceph/cache.c | 123 -----------
 fs/ceph/cache.h | 101 +++------
 fs/ceph/caps.c  |  10 +-
 fs/ceph/inode.c |   1 +
 6 files changed, 236 insertions(+), 536 deletions(-)

-- 
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

