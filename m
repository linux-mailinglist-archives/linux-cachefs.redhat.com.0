Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7953A4B8FA3
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Feb 2022 18:48:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-K3yrwIpHOUiU74bKka79cw-1; Wed, 16 Feb 2022 12:48:28 -0500
X-MC-Unique: K3yrwIpHOUiU74bKka79cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E905814245;
	Wed, 16 Feb 2022 17:48:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5065C7D722;
	Wed, 16 Feb 2022 17:48:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2CB018095C9;
	Wed, 16 Feb 2022 17:48:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GHmIfu009947 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 12:48:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16F5541136F0; Wed, 16 Feb 2022 17:48:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12F3941136EC
	for <linux-cachefs@redhat.com>; Wed, 16 Feb 2022 17:48:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA0EF3C0D1AC
	for <linux-cachefs@redhat.com>; Wed, 16 Feb 2022 17:48:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-649-j-a375FdMcywvKaydoF4bw-1; Wed, 16 Feb 2022 12:48:16 -0500
X-MC-Unique: j-a375FdMcywvKaydoF4bw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D82B560F13;
	Wed, 16 Feb 2022 17:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52DAC340E8;
	Wed, 16 Feb 2022 17:48:13 +0000 (UTC)
Date: Wed, 16 Feb 2022 18:48:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <Yg0421B10PPwunI+@kroah.com>
References: <bd9cb3bb-e29c-d4b3-e9bf-915b9771b553@linux.alibaba.com>
	<20220215111335.123528-1-jefflexu@linux.alibaba.com>
	<YgzWkhXCnlNDADvb@kroah.com>
	<becd656c-701c-747e-f063-2b9867cbd3d2@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <becd656c-701c-747e-f063-2b9867cbd3d2@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v4 05/23] cachefiles: introduce new
 devnode for on-demand read mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 16, 2022 at 08:49:35PM +0800, JeffleXu wrote:
> >> +struct cachefiles_req_in {
> >> +	uint64_t id;
> >> +	uint64_t off;
> >> +	uint64_t len;
> > 
> > For structures that cross the user/kernel boundry, you have to use the
> > correct types.  For this it would be __u64.
> 
> OK I will change to __xx style in the next version.
> 
> By the way, I can't understand the disadvantage of uintxx_t style.

The "uint*" types are not valid kernel types.  They are userspace types
and do not transfer properly in all arches and situations when crossing
the user/kernel boundry.  They are also in a different C "namespace", so
should not even be used in kernel code, although a lot of people do
because they are used to writing userspace C code :(

thanks,

greg k-h

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

