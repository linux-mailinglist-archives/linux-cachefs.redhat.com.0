Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6004C322B1C
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 14:06:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-dweBlDSJMUybcUQS7e9JoQ-1; Tue, 23 Feb 2021 08:06:46 -0500
X-MC-Unique: dweBlDSJMUybcUQS7e9JoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C10F9835E21;
	Tue, 23 Feb 2021 13:06:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FE2510016FA;
	Tue, 23 Feb 2021 13:06:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AFFB58075;
	Tue, 23 Feb 2021 13:06:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ND6fC6010500 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 08:06:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F70D202E956; Tue, 23 Feb 2021 13:06:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AAA2202E946
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 13:06:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9B085A5A6
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 13:06:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-340-mRgNAh88N2G4bMlhCHHDxw-1;
	Tue, 23 Feb 2021 08:06:33 -0500
X-MC-Unique: mRgNAh88N2G4bMlhCHHDxw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 781F364E31;
	Tue, 23 Feb 2021 13:06:31 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Tue, 23 Feb 2021 08:06:23 -0500
Message-Id: <20210223130629.249546-1-jlayton@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11ND6fC6010500
X-loop: linux-cachefs@redhat.com
Cc: willy@infradead.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, idryomov@gmail.com
Subject: [Linux-cachefs] [PATCH v3 0/6] ceph: convert to netfs helper library
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

This is the third posting of this patchset. The main differences between
this one and the last are some bugfixes, and cleanups:

- rebase onto David's latest fscache-netfs-lib set
- unify the netfs_read_request_ops into one struct
- fix inline_data handling in write_begin
- remove the now-unneeded i_fscache_gen field from ceph_inode_info
- rename gfp_flags to gfp in releasepage
- pass appropriate was_async flag to netfs_subreq_terminated

This set is currently sitting in the ceph-client/testing branch, so
it should get good testing coverage over the next few weeks via in
the teuthology lab.

Jeff Layton (6):
  ceph: disable old fscache readpage handling
  ceph: rework PageFsCache handling
  ceph: fix fscache invalidation
  ceph: convert readpage to fscache read helper
  ceph: plug write_begin into read helper
  ceph: convert ceph_readpages to ceph_readahead

 fs/ceph/Kconfig |   1 +
 fs/ceph/addr.c  | 541 +++++++++++++++++++-----------------------------
 fs/ceph/cache.c | 125 -----------
 fs/ceph/cache.h | 101 +++------
 fs/ceph/caps.c  |  10 +-
 fs/ceph/inode.c |   1 +
 fs/ceph/super.h |   2 +-
 7 files changed, 242 insertions(+), 539 deletions(-)

-- 
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

