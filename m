Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 959854843FF
	for <lists+linux-cachefs@lfdr.de>; Tue,  4 Jan 2022 15:59:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-UsHbFLkIN2O9dhAU691BWw-1; Tue, 04 Jan 2022 09:59:19 -0500
X-MC-Unique: UsHbFLkIN2O9dhAU691BWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0319B344B0;
	Tue,  4 Jan 2022 14:59:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5965B10589BC;
	Tue,  4 Jan 2022 14:59:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 661C11809CB8;
	Tue,  4 Jan 2022 14:59:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204ExC7P028129 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 09:59:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 56DFEC080A8; Tue,  4 Jan 2022 14:59:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52326C08090
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:59:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37DEC1064FB1
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:59:12 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-353-kcMjJMhTPiOpCyAcaC4PEw-1; Tue, 04 Jan 2022 09:59:07 -0500
X-MC-Unique: kcMjJMhTPiOpCyAcaC4PEw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V0z5cF9_1641308333
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V0z5cF9_1641308333) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 04 Jan 2022 22:58:55 +0800
Date: Tue, 4 Jan 2022 22:58:53 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YdRgrWEDU8sJVExX@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
	dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-8-jefflexu@linux.alibaba.com>
	<YdRattisu+ITYvvZ@B-P7TQMD6M-0146.local>
MIME-Version: 1.0
In-Reply-To: <YdRattisu+ITYvvZ@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 07/23] erofs: add nodev mode
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 04, 2022 at 10:33:26PM +0800, Gao Xiang wrote:
> On Mon, Dec 27, 2021 at 08:54:28PM +0800, Jeffle Xu wrote:
> > Until then erofs is exactly blockdev based filesystem. In other using
> > scenarios (e.g. container image), erofs needs to run upon files.
> > 
> > This patch introduces a new nodev mode, in which erofs could be mounted
> > from a bootstrap blob file containing the complete erofs image.
> > 
> > The following patch will introduce a new mount option "uuid", by which
> > users could specify the bootstrap blob file.
> > 
> > Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> 
> I think the order of some patches in this patchset can be improved.
> 
> Take this patch as an example. This patch introduces a new mount
> option called "uuid", so the kernel will just accept it (which
> generates a user-visible impact) after this patch but it doesn't
> actually work.
> 
> Therefore, we actually have three different behaviors here:
>  - kernel doesn't support "uuid" mount option completely;
>  - kernel support "uuid" but it doesn't work;
>  - kernel support "uuid" correctly (maybe after some random patch);
> 
> Actually that is bad for bisecting since there are some commits
> having temporary behaviors. And we don't know which commit
> actually fully implements this "uuid" mount option.
> 
> So personally I think the proper order is just like the bottom-up
> approach, and make sure each patch can be tested / bisected
> independently.

Oh, I may misread this patch, but I still think we'd better to
avoid dead paths "TODO" like this as much as possible.

Just do in the bottom-up way.

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

