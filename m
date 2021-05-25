Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7B94390184
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 15:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621947679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JeSjz3GCtYr5FFRCJ6uHMGaTPCsnywTmTZTkze0e6cE=;
	b=V0eVGmKy6gULPtJEpcFdSrcykU+q3q5NEOhmO5GZ9HAxU2gzR9+mgpLKONq5jaBI3tIzTq
	XQSnQqDEcIchtk3XFWHJA+BJkvqhmtHV6lU7tstos0nvLukOZRsOmTeeDCD8EalcYU6BGP
	cYHncH3V1jBvo/JRqtB5KCDp1GMeod4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-2zuviNUNM6W0CWRQhifdHg-1; Tue, 25 May 2021 09:01:18 -0400
X-MC-Unique: 2zuviNUNM6W0CWRQhifdHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C5DC6D24F;
	Tue, 25 May 2021 13:01:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A626A5D767;
	Tue, 25 May 2021 13:01:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01E2459CCF;
	Tue, 25 May 2021 13:01:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PD19uL016803 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 09:01:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BF471B400; Tue, 25 May 2021 13:01:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-24.rdu2.redhat.com
	[10.10.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E01B86060F;
	Tue, 25 May 2021 13:01:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Tue, 25 May 2021 14:01:02 +0100
Message-ID: <4007708.1621947662@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14PD19uL016803
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, willy@infradead.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	geert@linux-m68k.org, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [GIT PULL] netfs: Fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4007707.1621947662.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

 
Hi Linus,

If you could pull this, there are a couple of fixes to the new netfs lib in
it:

 (1) Pass the AOP flags through from netfs_write_begin() into
     grab_cache_page_write_begin().

 (2) Automatically enable in Kconfig netfs lib rather than presenting an
     option for manual enablement.

David
---
The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-lib-fixes-20200525

for you to fetch changes up to b71c791254ff5e78a124c8949585dccd9e225e06:

  netfs: Make CONFIG_NETFS_SUPPORT auto-selected rather than manual (2021-05-25 13:48:04 +0100)

----------------------------------------------------------------
netfslib fixes

----------------------------------------------------------------
David Howells (2):
      netfs: Pass flags through to grab_cache_page_write_begin()
      netfs: Make CONFIG_NETFS_SUPPORT auto-selected rather than manual

 fs/netfs/Kconfig       | 2 +-
 fs/netfs/read_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

