Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E151F2F3
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 May 2022 05:29:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-yGqRBuzkN42eZTIsXR3NKQ-1; Sun, 08 May 2022 23:29:45 -0400
X-MC-Unique: yGqRBuzkN42eZTIsXR3NKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08C5A3806723;
	Mon,  9 May 2022 03:29:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F356714C4C91;
	Mon,  9 May 2022 03:29:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C31321947054;
	Mon,  9 May 2022 03:29:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5B731947042 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  9 May 2022 03:29:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AFA3F2166B4A; Mon,  9 May 2022 03:29:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB14D2166B2F
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 03:29:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED4E08002B2
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 03:29:39 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-t5ZHEIzWOGi_S7fr_rOzwQ-1; Sun, 08 May 2022 23:29:37 -0400
X-MC-Unique: t5ZHEIzWOGi_S7fr_rOzwQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R881e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0VCcZKZu_1652066971
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VCcZKZu_1652066971) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 09 May 2022 11:29:33 +0800
Date: Mon, 9 May 2022 11:29:29 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Xin Yin <yinxin.x@bytedance.com>
Message-ID: <YniKmToYBm5Nmbk6@B-P7TQMD6M-0146.local>
Mail-Followup-To: Xin Yin <yinxin.x@bytedance.com>,
 JeffleXu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org
References: <20220507083154.18226-1-yinxin.x@bytedance.com>
 <dfcbda24-3969-f374-b209-81c3818246c1@linux.alibaba.com>
 <CAK896s68f5Snrip8TYPfDbObOpNoTtWW+0WBXzTiJbadAShGrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK896s68f5Snrip8TYPfDbObOpNoTtWW+0WBXzTiJbadAShGrg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [External] Re: [PATCH v2] erofs: change to use
 asyncronous io for fscache readpage/readahead
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 09, 2022 at 11:05:47AM +0800, Xin Yin wrote:
> On Sat, May 7, 2022 at 9:08 PM JeffleXu <jefflexu@linux.alibaba.com> wrote:
> >
> >
> >
> > On 5/7/22 4:31 PM, Xin Yin wrote:
> > > Use asyncronous io to read data from fscache may greatly improve IO
> > > bandwidth for sequential buffer read scenario.
> > >
> > > Change erofs_fscache_read_folios to erofs_fscache_read_folios_async,
> > > and read data from fscache asyncronously. Make .readpage()/.readahead()
> > > to use this new helper.
> > >
> > > Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> > > ---
> >
> > s/asyncronous/asynchronous/
> > s/asyncronously/asynchronously/
> >
> Thanks for pointing this out , I will fix it.
> 
> > BTW, "convert to asynchronous readahead" may be more concise?
> >
> You mean the title of this patch?  But, actually we also change to use
> this asynchronous io helper for .readpage() now , so I think we need
> to point this in the title. right ?

No worries, I pushed this for 0day ci yesterday, Jeffle may send out
another v11 with this patch included if needed.

Thanks,
Gao Xiang

> 
> Thanks,
> Xin Yin
> > Apart from that, LGTM
> >
> > Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> >
> >
> > --
> > Thanks,
> > Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

