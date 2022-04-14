Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24D5009D8
	for <lists+linux-cachefs@lfdr.de>; Thu, 14 Apr 2022 11:29:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-FIEOAyOANomyVIiQh1dIzw-1; Thu, 14 Apr 2022 05:29:38 -0400
X-MC-Unique: FIEOAyOANomyVIiQh1dIzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BD7D1014A63;
	Thu, 14 Apr 2022 09:29:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30955111E3EA;
	Thu, 14 Apr 2022 09:29:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F9A71940347;
	Thu, 14 Apr 2022 09:29:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EC8901940341 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 14 Apr 2022 09:29:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3621401E99; Thu, 14 Apr 2022 09:29:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFA31401E75
 for <linux-cachefs@redhat.com>; Thu, 14 Apr 2022 09:29:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96984185A7B2
 for <linux-cachefs@redhat.com>; Thu, 14 Apr 2022 09:29:34 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-COn4ScKCNz2n9qVZyXtUkg-1; Thu, 14 Apr 2022 05:29:32 -0400
X-MC-Unique: COn4ScKCNz2n9qVZyXtUkg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VA1uGiX_1649928564
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VA1uGiX_1649928564) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 14 Apr 2022 17:29:27 +0800
Date: Thu, 14 Apr 2022 17:29:24 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Message-ID: <YlfpdAjfRclK4aLQ@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
 linux-erofs@lists.ozlabs.org, torvalds@linux-foundation.org,
 gregkh@linuxfoundation.org, willy@infradead.org,
 linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
 gerry@linux.alibaba.com, eguan@linux.alibaba.com,
 linux-kernel@vger.kernel.org, luodaowen.backend@bytedance.com,
 tianzichen@kuaishou.com, fannaihao@baidu.com
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <YlLS47A9TpHyZJQi@B-P7TQMD6M-0146.local>
 <CAFQAk7iUuaUL40NGzOkCOL=P9d6PgsDjRoKLs_5KDycaA9RQ4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFQAk7iUuaUL40NGzOkCOL=P9d6PgsDjRoKLs_5KDycaA9RQ4w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v8 00/20] fscache,
 erofs: fscache-based on-demand read semantics
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
Cc: tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 torvalds@linux-foundation.org, chao@kernel.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 luodaowen.backend@bytedance.com, xiang@kernel.org, gerry@linux.alibaba.com,
 linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jiachen,

On Thu, Apr 14, 2022 at 04:10:10PM +0800, Jiachen Zhang wrote:
> On Sun, Apr 10, 2022 at 8:52 PM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> >
> > On Wed, Apr 06, 2022 at 03:55:52PM +0800, Jeffle Xu wrote:
> > > changes since v7:
> > > - rebased to 5.18-rc1
> > > - include "cachefiles: unmark inode in use in error path" patch into
> > >   this patchset to avoid warning from test robot (patch 1)
> > > - cachefiles: rename [cookie|volume]_key_len field of struct
> > >   cachefiles_open to [cookie|volume]_key_size to avoid potential
> > >   misunderstanding. Also add more documentation to
> > >   include/uapi/linux/cachefiles.h. (patch 3)
> > > - cachefiles: valid check for error code returned from user daemon
> > >   (patch 3)
> > > - cachefiles: change WARN_ON_ONCE() to pr_info_once() when user daemon
> > >   closes anon_fd prematurely (patch 4/5)
> > > - ready for complete review
> > >
> > >
> > > Kernel Patchset
> > > ---------------
> > > Git tree:
> > >
> > >     https://github.com/lostjeffle/linux.git jingbo/dev-erofs-fscache-v8
> > >
> > > Gitweb:
> > >
> > >     https://github.com/lostjeffle/linux/commits/jingbo/dev-erofs-fscache-v8
> > >
> > >
> > > User Daemon for Quick Test
> > > --------------------------
> > > Git tree:
> > >
> > >     https://github.com/lostjeffle/demand-read-cachefilesd.git main
> > >
> > > Gitweb:
> > >
> > >     https://github.com/lostjeffle/demand-read-cachefilesd
> > >
> >
> > Btw, we've also finished a preliminary end-to-end on-demand download
> > daemon in order to test the fscache on-demand kernel code as a real
> > end-to-end workload for container use cases:
> >
> > User guide: https://github.com/dragonflyoss/image-service/blob/fscache/docs/nydus-fscache.md
> > Video: https://youtu.be/F4IF2_DENXo
> >
> > Thanks,
> > Gao Xiang
> 
> Hi Xiang,
> 
> I think this feature is interesting and promising. So I have performed
> some tests according to the user guide. Hope it can be an upstream
> feature.

Many thanks for the feedback. We're doing our best to form/stablize it
now. Still struggle with some specific cases.

Thanks,
Gao Xiang


> 
> Thanks,
> Jiachen

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

