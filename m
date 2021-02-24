Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 58D91323B01
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Feb 2021 12:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614164788;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3heyJUSRYlVRc3mJA9RYpCFK1MaKZIn/eU7XCnVycqU=;
	b=eAhzfbrlWqDyrg3rW/3kS0qn8+SplJFjO0jcfidXLaCLJKqiDDm5X5DzNCBzUJHFXJaWB6
	W0VIHD4Nvk4vb66eHv5jq3f26SorRwzjN81CC8g1Pn9OB+Mi6FRqKv0cHqzt/xZ1lZn+3T
	xXFWYkfdypSMfRlYnM/BwTSf7B1QVp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-ZETtDI5DNgicio49VNOJEg-1; Wed, 24 Feb 2021 06:06:10 -0500
X-MC-Unique: ZETtDI5DNgicio49VNOJEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB15F835E25;
	Wed, 24 Feb 2021 11:06:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C4F60C5F;
	Wed, 24 Feb 2021 11:06:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DEBB18095CB;
	Wed, 24 Feb 2021 11:06:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11OB65Cm023667 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 06:06:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E00F21001281; Wed, 24 Feb 2021 11:06:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from [10.72.12.156] (ovpn-12-156.pek2.redhat.com [10.72.12.156])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B41110016F9;
	Wed, 24 Feb 2021 11:05:59 +0000 (UTC)
To: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org
References: <20210223130629.249546-1-jlayton@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <aceeb647-f75a-8146-cab5-ecbfce7cd8bc@redhat.com>
Date: Wed, 24 Feb 2021 19:05:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210223130629.249546-1-jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, idryomov@gmail.com, linux-cachefs@redhat.com,
	willy@infradead.org
Subject: Re: [Linux-cachefs] [PATCH v3 0/6] ceph: convert to netfs helper
	library
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2021/2/23 21:06, Jeff Layton wrote:
> This is the third posting of this patchset. The main differences between
> this one and the last are some bugfixes, and cleanups:
>
> - rebase onto David's latest fscache-netfs-lib set
> - unify the netfs_read_request_ops into one struct
> - fix inline_data handling in write_begin
> - remove the now-unneeded i_fscache_gen field from ceph_inode_info
> - rename gfp_flags to gfp in releasepage
> - pass appropriate was_async flag to netfs_subreq_terminated
>
> This set is currently sitting in the ceph-client/testing branch, so
> it should get good testing coverage over the next few weeks via in
> the teuthology lab.
>
> Jeff Layton (6):
>    ceph: disable old fscache readpage handling
>    ceph: rework PageFsCache handling
>    ceph: fix fscache invalidation
>    ceph: convert readpage to fscache read helper
>    ceph: plug write_begin into read helper
>    ceph: convert ceph_readpages to ceph_readahead
>
>   fs/ceph/Kconfig |   1 +
>   fs/ceph/addr.c  | 541 +++++++++++++++++++-----------------------------
>   fs/ceph/cache.c | 125 -----------
>   fs/ceph/cache.h | 101 +++------
>   fs/ceph/caps.c  |  10 +-
>   fs/ceph/inode.c |   1 +
>   fs/ceph/super.h |   2 +-
>   7 files changed, 242 insertions(+), 539 deletions(-)
>
This series LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

