Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3AF2BAEDB
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:31:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-fmZBxvTfPWydg8vDe9BNZw-1; Fri, 20 Nov 2020 10:31:04 -0500
X-MC-Unique: fmZBxvTfPWydg8vDe9BNZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DD021922962;
	Fri, 20 Nov 2020 15:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8E318993;
	Fri, 20 Nov 2020 15:31:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14BBB180954D;
	Fri, 20 Nov 2020 15:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFUHo6017640 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:30:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 518912026D47; Fri, 20 Nov 2020 15:30:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C0C02026D5D
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 15:30:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F8FA802D2A
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 15:30:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-87-26-dvb2TONGn49CnzVMo8A-1; 
	Fri, 20 Nov 2020 10:30:10 -0500
X-MC-Unique: 26-dvb2TONGn49CnzVMo8A-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EDE0622252;
	Fri, 20 Nov 2020 15:30:07 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 20 Nov 2020 10:30:01 -0500
Message-Id: <20201120153006.304296-1-jlayton@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AKFUHo6017640
X-loop: linux-cachefs@redhat.com
Cc: idryomov@redhat.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 0/5] ceph: conversion to new netfs/fscache
	APIs
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

This patchset converts ceph to the new netfs/fscache APIs, and depends
on the fscache overhaul that David Howells recently posted. It also adds
support for writing to the cache. Due to the fact that we're leveraging
the new netfs_* helpers, this is substantial reduction in code as well.

I've tested this pretty extensively using xfstests and kernel builds,
both with and without the cache enabled. It all seems to do the right
thing now.

Jeff Layton (5):
  ceph: conversion to new fscache API
  ceph: convert readpage to fscache read helper
  ceph: plug write_begin into read helper
  ceph: convert ceph_readpages to ceph_readahead
  ceph: add fscache writeback support

 fs/ceph/Kconfig |   3 +-
 fs/ceph/addr.c  | 627 ++++++++++++++++++++++--------------------------
 fs/ceph/cache.c | 295 +++++++----------------
 fs/ceph/cache.h | 106 +++-----
 fs/ceph/caps.c  |  12 +-
 fs/ceph/file.c  |  14 +-
 fs/ceph/inode.c |  24 +-
 fs/ceph/super.c |   1 +
 fs/ceph/super.h |   1 -
 9 files changed, 450 insertions(+), 633 deletions(-)

-- 
2.28.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

