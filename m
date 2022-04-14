Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A1506CC0
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 14:48:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-qC-6q5CbNoiWYNFIZi4HfA-1; Tue, 19 Apr 2022 08:48:21 -0400
X-MC-Unique: qC-6q5CbNoiWYNFIZi4HfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34AE42999B54;
	Tue, 19 Apr 2022 12:48:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D342403375;
	Tue, 19 Apr 2022 12:48:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA6E51940347;
	Tue, 19 Apr 2022 12:48:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 450001940344 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 14 Apr 2022 08:10:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2141A40E80F4; Thu, 14 Apr 2022 08:10:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D0C540E80E0
 for <linux-cachefs@redhat.com>; Thu, 14 Apr 2022 08:10:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0389C185A7A4
 for <linux-cachefs@redhat.com>; Thu, 14 Apr 2022 08:10:24 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-P2XU45FqNIS9KG9DgnGLCQ-1; Thu, 14 Apr 2022 04:10:22 -0400
X-MC-Unique: P2XU45FqNIS9KG9DgnGLCQ-1
Received: by mail-io1-f46.google.com with SMTP id z6so4634933iot.0
 for <linux-cachefs@redhat.com>; Thu, 14 Apr 2022 01:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=80GuG9Z2OB5edjjpunkIyc1yhfEaarhhzGyq+14i704=;
 b=U5YRqQgERFwN5s2h25G4Bk/MNDi4mJ8Ev8rD4FKQwuqk5tNMO2tx9/8XPzIPUBiu+q
 kC/AQZknDDiHWcZlbg1PQmX5UatFY6qV77X3CbtRHl19YSlmb5AU0QPmPd27RZXwUbCo
 xmZrlW0GjASAbXxiQMBj48Pu3v27UvJSo+nqpJJctktZ4yaYCGG78BiyI76+ipu3NKmd
 qrsV5TQJyC7qpAm53Z8FZ1Rae3+9ssIubmbb5HJRIaiEDDbM7hfl97olRUTJs7S5G1DZ
 URYcXAemWSHiWyhZNCdRt/XOZdw1Kr2YK1bGBsJh2EhveaKMPR11dSLhWOKhpNo66JkE
 8cxg==
X-Gm-Message-State: AOAM5336n5dZLSRWGdCI4nwRZPfyY6APFnIkPOoZ9FxGX1zRUdqPHZcq
 ZjZQ/25XCfrpHA/M3wJ+5WzmqMZbEuyByuzojIcHSgQhILU+kw==
X-Google-Smtp-Source: ABdhPJyQyyUIJu7HSaI/sHH6jgGH90kBT3f1SyDRMUnKe+RNtKh/8DVg+hrLhzrO3qrrF7NYPZxCyZP+Y63gqiTXviI=
X-Received: by 2002:a05:6638:3e8f:b0:326:72cb:2b49 with SMTP id
 ch15-20020a0566383e8f00b0032672cb2b49mr715190jab.247.1649923821659; Thu, 14
 Apr 2022 01:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <YlLS47A9TpHyZJQi@B-P7TQMD6M-0146.local>
In-Reply-To: <YlLS47A9TpHyZJQi@B-P7TQMD6M-0146.local>
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Date: Thu, 14 Apr 2022 16:10:10 +0800
Message-ID: <CAFQAk7iUuaUL40NGzOkCOL=P9d6PgsDjRoKLs_5KDycaA9RQ4w@mail.gmail.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com, 
 linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org, 
 linux-erofs@lists.ozlabs.org, torvalds@linux-foundation.org, 
 gregkh@linuxfoundation.org, willy@infradead.org, 
 linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com, 
 bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com, gerry@linux.alibaba.com, 
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org, 
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com, fannaihao@baidu.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Tue, 19 Apr 2022 12:48:18 +0000
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 10, 2022 at 8:52 PM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
>
> On Wed, Apr 06, 2022 at 03:55:52PM +0800, Jeffle Xu wrote:
> > changes since v7:
> > - rebased to 5.18-rc1
> > - include "cachefiles: unmark inode in use in error path" patch into
> >   this patchset to avoid warning from test robot (patch 1)
> > - cachefiles: rename [cookie|volume]_key_len field of struct
> >   cachefiles_open to [cookie|volume]_key_size to avoid potential
> >   misunderstanding. Also add more documentation to
> >   include/uapi/linux/cachefiles.h. (patch 3)
> > - cachefiles: valid check for error code returned from user daemon
> >   (patch 3)
> > - cachefiles: change WARN_ON_ONCE() to pr_info_once() when user daemon
> >   closes anon_fd prematurely (patch 4/5)
> > - ready for complete review
> >
> >
> > Kernel Patchset
> > ---------------
> > Git tree:
> >
> >     https://github.com/lostjeffle/linux.git jingbo/dev-erofs-fscache-v8
> >
> > Gitweb:
> >
> >     https://github.com/lostjeffle/linux/commits/jingbo/dev-erofs-fscache-v8
> >
> >
> > User Daemon for Quick Test
> > --------------------------
> > Git tree:
> >
> >     https://github.com/lostjeffle/demand-read-cachefilesd.git main
> >
> > Gitweb:
> >
> >     https://github.com/lostjeffle/demand-read-cachefilesd
> >
>
> Btw, we've also finished a preliminary end-to-end on-demand download
> daemon in order to test the fscache on-demand kernel code as a real
> end-to-end workload for container use cases:
>
> User guide: https://github.com/dragonflyoss/image-service/blob/fscache/docs/nydus-fscache.md
> Video: https://youtu.be/F4IF2_DENXo
>
> Thanks,
> Gao Xiang

Hi Xiang,

I think this feature is interesting and promising. So I have performed
some tests according to the user guide. Hope it can be an upstream
feature.

Thanks,
Jiachen

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

