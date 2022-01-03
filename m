Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63127482E7E
	for <lists+linux-cachefs@lfdr.de>; Mon,  3 Jan 2022 07:32:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-m_raJqs8NXam0TqkyEYDmA-1; Mon, 03 Jan 2022 01:32:26 -0500
X-MC-Unique: m_raJqs8NXam0TqkyEYDmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88A822F47;
	Mon,  3 Jan 2022 06:32:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1F76AB9C;
	Mon,  3 Jan 2022 06:32:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD7174BB7C;
	Mon,  3 Jan 2022 06:32:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2036WFNM018140 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 3 Jan 2022 01:32:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6C261C15E74; Mon,  3 Jan 2022 06:32:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67869C15E71
	for <linux-cachefs@redhat.com>; Mon,  3 Jan 2022 06:32:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53C66800B29
	for <linux-cachefs@redhat.com>; Mon,  3 Jan 2022 06:32:15 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-546-KQhJzuK_O12z__v2EuUX_A-1; Mon, 03 Jan 2022 01:32:13 -0500
X-MC-Unique: KQhJzuK_O12z__v2EuUX_A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V0dXccU_1641191526
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V0dXccU_1641191526) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 03 Jan 2022 14:32:07 +0800
Message-ID: <d57c4609-a4c3-5e60-8257-a0704aaa30a5@linux.alibaba.com>
Date: Mon, 3 Jan 2022 14:32:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
From: JeffleXu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-14-jefflexu@linux.alibaba.com>
In-Reply-To: <20211227125444.21187-14-jefflexu@linux.alibaba.com>
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
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 13/23] erofs: implement fscache-based
	data read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/27/21 8:54 PM, Jeffle Xu wrote:
>  
> +static inline void do_copy_page(struct page *from, struct page *to,
> +				size_t offset, size_t len)
> +{
> +	char *vfrom, *vto;
> +
> +	vfrom = kmap_atomic(from);
> +	vto = kmap_atomic(to);
> +	memcpy(vto, vfrom + offset, len);
> +	kunmap_atomic(vto);
> +	kunmap_atomic(vfrom);
> +}
> +

It seems that this private function can be replaced by memcpy_page().
Will be done in the next version.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

