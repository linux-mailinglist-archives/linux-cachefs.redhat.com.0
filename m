Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF4477946
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 17:35:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-1nodWrOSOBi9gkJzemViEg-1; Thu, 16 Dec 2021 11:35:50 -0500
X-MC-Unique: 1nodWrOSOBi9gkJzemViEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B9B81EE64;
	Thu, 16 Dec 2021 16:35:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 857401037F42;
	Thu, 16 Dec 2021 16:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 113DA1806D2B;
	Thu, 16 Dec 2021 16:35:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BB741LJ022264 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 11 Dec 2021 02:04:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A9A301121315; Sat, 11 Dec 2021 07:04:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A51B81121314
	for <linux-cachefs@redhat.com>; Sat, 11 Dec 2021 07:03:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F373185A79C
	for <linux-cachefs@redhat.com>; Sat, 11 Dec 2021 07:03:58 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-431-Vlqz3fSnPVKGUEZhiYzrTg-1; Sat, 11 Dec 2021 02:03:56 -0500
X-MC-Unique: Vlqz3fSnPVKGUEZhiYzrTg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V-DZw3U_1639205850
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V-DZw3U_1639205850) by smtp.aliyun-inc.com(127.0.0.1);
	Sat, 11 Dec 2021 14:57:33 +0800
Date: Sat, 11 Dec 2021 14:57:30 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YbRL2glGzjfZkVbH@B-P7TQMD6M-0146.local>
Mail-Followup-To: JeffleXu <jefflexu@linux.alibaba.com>,
	David Howells <dhowells@redhat.com>, chao@kernel.org,
	tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
References: <20211210073619.21667-10-jefflexu@linux.alibaba.com>
	<20211210073619.21667-1-jefflexu@linux.alibaba.com>
	<292572.1639150908@warthog.procyon.org.uk>
	<fba8a28b-14c1-bf58-0578-32415c95f55d@linux.alibaba.com>
	<a95618c5-723d-bfaa-bf7a-48950be8d31d@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <a95618c5-723d-bfaa-bf7a-48950be8d31d@linux.alibaba.com>
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
X-Mailman-Approved-At: Thu, 16 Dec 2021 11:35:45 -0500
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [RFC 09/19] netfs: refactor netfs_rreq_unlock()
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

Hi Jeffle,

On Sat, Dec 11, 2021 at 01:44:47PM +0800, JeffleXu wrote:
> 
> 
> On 12/11/21 1:23 PM, JeffleXu wrote:
> > 
> > 
> > On 12/10/21 11:41 PM, David Howells wrote:
> >> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> >>
> >>> In demand-read case, the input folio of netfs API is may not the page
> >>
> >> "is may not the page"?  I think you're missing a verb (and you have too many
> >> auxiliary verbs;-)
> >>
> > 
> > Sorry for my poor English... What I want to express is that
> > 
> > "In demand-read case, the input folio of netfs API may not be the page
> > cache inside the address space of the netfs file."
> > 
> 
> By the way, can we change the current address_space based netfs API to
> folio-based, which shall be more general? That is, the current
> implementation of netfs API uses (address_space, page_offset, len) tuple
> to describe the destination where the read data shall be store into.
> While in the demand-read case, the input folio may not be the page
> cache, and thus there's no address_space attached with it.

Thanks for your hard effort on this!

Just a rough look. Could we use a pseudo inode (actually the current
managed_inode can be used as this) to retain metadata for fscache
scenarios? (since it's better to cache all metadata rather than drop
directly, also the alloc_page() - free_page() cycle takes more time).

Also if my own limited understanding is correct, you could directly
use file inode pages with netfs_readpage_demand() rather than
get_meta_page and then memcpy to the file inode pages.

Thanks,
Gao Xiang

> 
> -- 
> Thanks,
> Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

