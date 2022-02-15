Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D84B69A5
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Feb 2022 11:46:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-pP9GVcg8MY-e9M-c1hOt5A-1; Tue, 15 Feb 2022 05:46:26 -0500
X-MC-Unique: pP9GVcg8MY-e9M-c1hOt5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E27332F26;
	Tue, 15 Feb 2022 10:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA005E4B7;
	Tue, 15 Feb 2022 10:46:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0AFE1809C88;
	Tue, 15 Feb 2022 10:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21FAkJiX013729 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 15 Feb 2022 05:46:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C61D81121330; Tue, 15 Feb 2022 10:46:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C81112132D
	for <linux-cachefs@redhat.com>; Tue, 15 Feb 2022 10:46:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B10A80088A
	for <linux-cachefs@redhat.com>; Tue, 15 Feb 2022 10:46:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-111-GCIfCm3yMxm_QyVDEECiCg-1; Tue, 15 Feb 2022 05:46:11 -0500
X-MC-Unique: GCIfCm3yMxm_QyVDEECiCg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2327261456;
	Tue, 15 Feb 2022 10:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2BEC340EB;
	Tue, 15 Feb 2022 10:37:24 +0000 (UTC)
Date: Tue, 15 Feb 2022 11:37:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YguCYmvdyRAOjHcP@kroah.com>
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
	<20220209060108.43051-6-jefflexu@linux.alibaba.com>
	<bd9cb3bb-e29c-d4b3-e9bf-915b9771b553@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <bd9cb3bb-e29c-d4b3-e9bf-915b9771b553@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: torvalds@linux-foundation.org, chao@kernel.org,
	linux-kernel@vger.kernel.org, willy@infradead.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org
Subject: Re: [Linux-cachefs] [PATCH v3 05/22] cachefiles: introduce new
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

On Tue, Feb 15, 2022 at 05:03:16PM +0800, JeffleXu wrote:
> Hi David,
> 
> FYI I've updated this patch on [1].
> 
> [1]
> https://github.com/lostjeffle/linux/commit/589dd838dc539aee291d1032406653a8f6269e6f.

We can not review random github links :(

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

