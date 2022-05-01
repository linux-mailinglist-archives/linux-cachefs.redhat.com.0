Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61464516288
	for <lists+linux-cachefs@lfdr.de>; Sun,  1 May 2022 09:59:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-8qxq5RFPO6GV_lzKfkeWGg-1; Sun, 01 May 2022 03:59:54 -0400
X-MC-Unique: 8qxq5RFPO6GV_lzKfkeWGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 203BB8002BF;
	Sun,  1 May 2022 07:59:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D0B040869CE;
	Sun,  1 May 2022 07:59:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C12A1947060;
	Sun,  1 May 2022 07:59:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2798194705D for <linux-cachefs@listman.corp.redhat.com>;
 Sun,  1 May 2022 07:59:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD65141617F; Sun,  1 May 2022 07:59:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9B03401474
 for <linux-cachefs@redhat.com>; Sun,  1 May 2022 07:59:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E5C229AA3BD
 for <linux-cachefs@redhat.com>; Sun,  1 May 2022 07:59:50 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-SjJDMLJeMlKXjjJuoPUz0w-1; Sun, 01 May 2022 03:59:49 -0400
X-MC-Unique: SjJDMLJeMlKXjjJuoPUz0w-1
Received: by mail-lj1-f182.google.com with SMTP id m23so15240785ljc.0
 for <linux-cachefs@redhat.com>; Sun, 01 May 2022 00:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bwS6neoJgwAscLo7SMr+briaL7cQkz+klklthFb5lCU=;
 b=a9UNAkEEe+K4tBhUpyiRl/fpjkoK6CUY5JztNEHQfPVTCF6aoN7XDcOp7jM/2VVq4G
 r/KIC/PWgdTJl/+klliIUtSMVUFADwb1FKu1F4FrpwfKqFQrZoarpJ7PuYRxFErZWxbB
 OxlGMCccurKaOssGn1rndCOgliqM/esp/ywxJlL4kisjCKyv5vYDuWwl5UhMTWDTPEyJ
 b+CpD8Mbyx9DSaxwkpca0cvwbbJ9UZlx7XBY96utCMoGUUJPxCYeN2XhfkmKFYCDRZzg
 ifpZpddTfLMNI2ZnFj6ODu04CVTjF7f9ufFUO2aLdqaUrawZW6pGHVX/dma5PWBi5IVq
 DUcQ==
X-Gm-Message-State: AOAM53280frviZEwfjNZog8KShybBVdKpnY6CZig0DRh0jax3DwtvCsX
 qJzUsD+6cVndyyOkkNWhP57InAVNmCbgOB0j0Qy9vA==
X-Google-Smtp-Source: ABdhPJwVs2ZVv+Eaq5VyLrhX5r9W7NBvf4my2q1OF2UJtKn+DFVoi8+nGzLLoOvLndBDI7z5HBcmwn406loffgvhLno=
X-Received: by 2002:a05:651c:4c7:b0:24f:4017:a2ce with SMTP id
 e7-20020a05651c04c700b0024f4017a2cemr4870748lji.5.1651391987333; Sun, 01 May
 2022 00:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220428233849.321495-1-yinxin.x@bytedance.com>
 <YmvbwKSdiCosPhAV@B-P7TQMD6M-0146.local>
In-Reply-To: <YmvbwKSdiCosPhAV@B-P7TQMD6M-0146.local>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Sun, 1 May 2022 15:59:37 +0800
Message-ID: <CAK896s701pZ_VzRUGLA=g5poAc+oqHqD=Swp14AVxND7ZVvg3A@mail.gmail.com>
To: jefflexu@linux.alibaba.com, xiang@kernel.org, dhowells@redhat.com, 
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com, 
 linux-fsdevel@vger.kernel.org, boyu.mt@taobao.com, lizefan.x@bytedance.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [External] Re: [RFC PATCH 0/1] erofs: change to
 use asynchronous io for fscache readahead
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 29, 2022 at 8:36 PM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
>
> Hi Xin,
>
> On Fri, Apr 29, 2022 at 07:38:48AM +0800, Xin Yin wrote:
> > Hi Jeffle & Xiang
> >
> > I have tested your fscache,erofs: fscache-based on-demand read semantics
> > v9 patches sets https://www.spinics.net/lists/linux-fsdevel/msg216178.html.
> > For now , it works fine with the nydus image-service. After the image data
> > is fully loaded to local storage, it does have great IO performance gain
> > compared with nydus V5 which is based on fuse.
>
> Yeah, thanks for your interest and efforts. Actually I'm pretty sure you
> could observe CPU, bandwidth and latency improvement on the dense deployed
> scenarios since our goal is to provide native performance when the data is
> ready, as well as image on-demand read, flexible cache data management to
> end users.
>
> >
> > For 4K random read , fscache-based erofs can get the same performance with
> > the original local filesystem. But I still saw a performance drop in the 4K
> > sequential read case. And I found the root cause is in erofs_fscache_readahead()
> > we use synchronous IO , which may stall the readahead pipelining.
> >
>
> Yeah, that is a known TODO, in principle, when such part of data is locally
> available, it will have the similar performance (bandwidth, latency, CPU
> loading) as loop device. But we don't implement asynchronous I/O for now,
> since we need to make the functionality work first, so thanks for your
> patch addressing this.
>
> > I have tried to change to use asynchronous io during erofs fscache readahead
> > procedure, as what netfs did. Then I saw a great performance gain.
> >
> > Here are my test steps and results:
> > - generate nydus v6 format image , in which stored a large file for IO test.
> > - launch nydus image-service , and  make image data fully loaded to local storage (ext4).
> > - run fio with below cmd.
> > fio -ioengine=psync -bs=4k -size=5G -direct=0 -thread -rw=read -filename=./test_image  -name="test" -numjobs=1 -iodepth=16 -runtime=60
>
> Yeah, although I can see what you mean (to test buffered I/O), the
> argument is still somewhat messy (maybe because we don't support
> fscache-based direct I/O for now. That is another TODO but with
> low priority.)
>
> >
> > v9 patches: 202654 KB/s
> > v9 patches + async readahead patch: 407213 KB/s
> > ext4: 439912 KB/s
>
> May I ask if such ext4 image is through a loop device? If not, that is
> reasonable. Anyway, it's not a big problem for now, we could optimize
> it later since it should be exactly the same finally.
>

This ext4 image is not through a loop device ,  just the same test
file stored in native ext4.  Actually , after further tests , I could
see that fscache-based erofs with async readahead patch almost achieve
native performance in sequential buffer read cases.

Thanks,
Xin Yin

> And I will drop a message to Jeffle for further review since we're
> closing to another 5-day national holiday.
>
> Thanks again!
> Gao Xiang
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

