Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E44D87FF
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Mar 2022 16:24:00 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511--cF9Kw2IP3uLvQK9cTyKxg-1; Mon, 14 Mar 2022 11:23:56 -0400
X-MC-Unique: -cF9Kw2IP3uLvQK9cTyKxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EF481C0E346;
	Mon, 14 Mar 2022 15:23:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 705BC407EE85;
	Mon, 14 Mar 2022 15:23:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B52D01956BB7;
	Mon, 14 Mar 2022 15:23:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DFE21194037A for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 14 Mar 2022 09:24:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF9501466C60; Mon, 14 Mar 2022 09:24:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBAE71466C50
 for <linux-cachefs@redhat.com>; Mon, 14 Mar 2022 09:24:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACCB4185A7A4
 for <linux-cachefs@redhat.com>; Mon, 14 Mar 2022 09:24:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-xYdkDFrHPX2FUioEPYy-EA-1; Mon, 14 Mar 2022 05:24:13 -0400
X-MC-Unique: xYdkDFrHPX2FUioEPYy-EA-1
Received: by mail-pj1-f43.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so16775178pjb.4
 for <linux-cachefs@redhat.com>; Mon, 14 Mar 2022 02:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZHSHqdSI/jBDMOjHUDo3932A1aQUbEpHtDBEyuk690=;
 b=WXCWEcju5c8IuLSDCXS/LqjhLeObwvhhNLp2++CvoCN5V5viLt1G15cEjPmmKzhh0O
 JxPtIUGnea3ha4rAZNXrgT+lPCwwDQgnRw6Ua5CdY5myRX+FYYyU74J2lKrlhPuze/fP
 rkUo60jwRIOudW+3yf7XL9bCQoeO4wFbXBmbPyJZ0zd82OUEzlLI9cDvgFQXo1mOdFm8
 4pYEHQAgrc0eU9Nex00+Hk+a49F7wn4ujXuCUa9DwaP7KuSRyLWIBcoCWSQbv6K8B9+w
 xF7veM3bxyEUv9XIoD7Y4rTzOqRllt/TfPjQ2bCmPZeMdUtIooMtDbjw4W11R6gctL3W
 wpmA==
X-Gm-Message-State: AOAM533qdBcFa+6WOojkFLyCqgjw3O3xKYe48LcyHAZDLi6mn8IlnV//
 JjvMTfbfVgajD7FGDiN0ccHAOg==
X-Google-Smtp-Source: ABdhPJyA0G98h1VBptmjEZZwwLqHGgKMVxnl+eFxUnrBeDx78Q8mXd6fuEyQkeky7YM6g6XZqAwhSg==
X-Received: by 2002:a17:903:41c9:b0:153:8a89:de18 with SMTP id
 u9-20020a17090341c900b001538a89de18mr212038ple.32.1647249852246; 
 Mon, 14 Mar 2022 02:24:12 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a056a00124e00b004f76d35c1dbsm15890636pfi.75.2022.03.14.02.24.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Mar 2022 02:24:11 -0700 (PDT)
From: "luodaowen.backend" <luodaowen.backend@bytedance.com>
To: jefflexu@linux.alibaba.com
Date: Mon, 14 Mar 2022 17:24:02 +0800
Message-Id: <20220314092402.43044-1-luodaowen.backend@bytedance.com>
In-Reply-To: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
References: <20220307123305.79520-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Mon, 14 Mar 2022 15:23:52 +0000
Subject: Re: [Linux-cachefs] [PATCH v4 00/21] fscache,
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
Cc: gregkh@linuxfoundation.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, tao.peng@linux.alibaba.com, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
 torvalds@linux-foundation.org, linux-fsdevel@vger.kernel.org,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
 xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6289240289155130336=="

--===============6289240289155130336==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi,

We're also interested in this way, hoping for the formal solution upstream so we can make use of it as well.

Thanks,
daowen

On Mon, 7 Mar 2022 20:32:44 +0800 Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>
> changes since v3:
> - cachefiles: The current implementation relies on the anonymous fd
> mechanism to avoid
>   the dependence on the format of cache file. When cache file is opened
>   for the first time, an anon_fd associated with the cache file is sent to
>   user daemon. User daemon could fetch and write data to cache file with
>   the given anon_fd. The following write to the anon_fd will finally
>   call to cachefiles kernel module, which will write data to cache file in
>   the latest format of cache file. Thus the on-demand read mode can
>   keep working no matter how cache file format could change in the
>   future. (patch 4)
> - cachefiles: the on-demand read mode reuses the existing
>   "/dev/cachefiles" devnode (patch 3)
> - erofs: squash several commits implementing readahead into single
>   commit (patch 20)
> - erofs: refactor the readahead routine, so that it can read multiple
>   pages each round (patch 20)
> - patch 1 and 7 have already been cherry-picked by the maintainers, but
>   have not been merged to the master. Keep them here for completeness.
>
>
> RFC: https://lore.kernel.org/all/YbRL2glGzjfZkVbH@B-P7TQMD6M-0146.local/t/
> v1: https://lore.kernel.org/lkml/47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com/T/
> v2: https://lore.kernel.org/all/2946d871-b9e1-cf29-6d39-bcab30f2854f@linux.alibaba.com/t/
> v3: https://lore.kernel.org/lkml/20220209060108.43051-1-jefflexu@linux.alibaba.com/T/
>
> [Background]
> ============
> Nydus [1] is a container image distribution service specially optimised
> for distribution over network. Nydus is an excellent container image
> acceleration solution, since it only pulls data from remote when it's
> really needed, a.k.a. on-demand reading.
>
> erofs (Enhanced Read-Only File System) is a filesystem specially
> optimised for read-only scenarios. (Documentation/filesystem/erofs.rst)
>
> Recently we are focusing on erofs in container images distribution
> scenario [2], trying to combine it with nydus. In this case, erofs can
> be mounted from one bootstrap file (metadata) with (optional) multiple
> data blob files (data) stored on another local filesystem. (All these
> files are actually image files in erofs disk format.)
>
> To accelerate the container startup (fetching container image from remote
> and then start the container), we do hope that the bootstrap blob file
> could support demand read. That is, erofs can be mounted and accessed
> even when the bootstrap/data blob files have not been fully downloaded.
>
> That means we have to manage the cache state of the bootstrap/data blob
> files (if cache hit, read directly from the local cache; if cache miss,
> fetch the data somehow). It would be painful and may be dumb for erofs to
> implement the cache management itself. Thus we prefer fscache/cachefiles
> to do the cache management. Besides, the demand-read feature shall be
> general and it can benefit other using scenarios if it can be implemented
> in fscache level.
>
> [1] https://nydus.dev
> [2] https://sched.co/pcdL
>
>
> [Overall Design]
> ================
>
> Please refer to patch 6 ("cachefiles: document on-demand read mode") for
> more details.
>
> When working in original mode, cachefiles mainly serves as a local cache for
> remote networking fs, while in on-demand read mode, cachefiles can boost the
> scenario where on-demand read semantics is needed, e.g. container image
> distribution.
>
> The essential difference between these two modes is that, in original mode,
> when cache miss, netfs itself will fetch data from remote, and then write the
> fetched data into cache file. While in on-demand read mode, a user daemon is
> responsible for fetching data and then writing to the cache file.
>
> The on-demand read mode relies on a simple protocol used for communication
> between kernel and user daemon.
>
> The current implementation relies on the anonymous fd mechanism to avoid
> the dependence on the format of cache file. When cache file is opened
> for the first time, an anon_fd associated with the cache file is sent to
> user daemon. With the given anon_fd, user daemon could fetch and write data
> into the cache file in the background, even when kernel has not triggered
> the cache miss. Besides, the write() syscall to the anon_fd will finally
> call cachefiles kernel module, which will write data to cache file in
> the latest format of cache file.
>
> 1. cache miss
> When cache miss, cachefiles kernel module will notify user daemon the
> anon_fd, along with the requested file range. When notified, user dameon
> needs to fetch data of the requested file range, and then write the fetched
> data into cache file with the given anonymous fd. When finished
> processing the request, user daemon needs to notify the kernel.
>
> After notifying the user daemon, the kernel read routine will hang there,
> until the request is handled by user daemon. When it's awaken by the
> notification from user daemon, i.e. the corresponding hole has been filled
> by the user daemon, it will retry to read from the same file range.
>
> 2. cache hit
> Once data is already ready in cache file, netfs will read from cache
> file directly.
>
>
> [Advantage of fscache-based demand-read]
> ========================================
> 1. Asynchronous Prefetch
> In current mechanism, fscache is responsible for cache state management,
> while the data plane (fetch data from local/remote on cache miss) is
> done on the user daemon side.
>
> If data has already been ready in the backing file, the upper fs (e.g.
> erofs) will read from the backing file directly and won't be trapped to
> user space anymore. Thus the user daemon could fetch data (from remote)
> asynchronously on the background, and thus accelerate the backing file
> accessing in some degree.
>
> 2. Support massive blob files
> Besides this mechanism supports a large amount of backing files, and
> thus can benefit the densely employed scenario.
>
> In our using scenario, one container image can correspond to one
> bootstrap file (required) and multiple data blob files (optional). For
> example, one container image for node.js will corresponds to ~20 files
> in total. In densely employed environment, there could be as many as
> hundreds of containers and thus thousands of backing files on one
> machine.
>
>
> [Test]
> ==========
> You could start a quick test by
> https://github.com/lostjeffle/demand-read-cachefilesd
>
>
>
> Jeffle Xu (21):
>   fscache: export fscache_end_operation()
>   cachefiles: export write routine
>   cachefiles: introduce on-demand read mode
>   cachefiles: notify user daemon with anon_fd when opening cache file
>   cachefiles: implement on-demand read
>   cachefiles: document on-demand read mode
>   erofs: use meta buffers for erofs_read_superblock()
>   erofs: export erofs_map_blocks()
>   erofs: add mode checking helper
>   erofs: register global fscache volume
>   erofs: add cookie context helper functions
>   erofs: add anonymous inode managing page cache of blob file
>   erofs: add erofs_fscache_read_pages() helper
>   erofs: register cookie context for bootstrap blob
>   erofs: implement fscache-based metadata read
>   erofs: implement fscache-based data read for non-inline layout
>   erofs: implement fscache-based data read for inline layout
>   erofs: register cookie context for data blobs
>   erofs: implement fscache-based data read for data blobs
>   erofs: implement fscache-based data readahead
>   erofs: add 'uuid' mount option
>
>  .../filesystems/caching/cachefiles.rst        | 159 +++++
>  fs/cachefiles/Kconfig                         |  11 +
>  fs/cachefiles/daemon.c                        | 576 +++++++++++++++++-
>  fs/cachefiles/internal.h                      |  48 ++
>  fs/cachefiles/io.c                            |  72 ++-
>  fs/cachefiles/namei.c                         |  16 +-
>  fs/erofs/Makefile                             |   3 +-
>  fs/erofs/data.c                               |  18 +-
>  fs/erofs/fscache.c                            | 496 +++++++++++++++
>  fs/erofs/inode.c                              |   6 +-
>  fs/erofs/internal.h                           |  30 +
>  fs/erofs/super.c                              | 106 +++-
>  fs/fscache/internal.h                         |  11 -
>  fs/nfs/fscache.c                              |   8 -
>  include/linux/fscache.h                       |  15 +
>  include/linux/netfs.h                         |   1 +
>  include/trace/events/cachefiles.h             |   2 +
>  include/uapi/linux/cachefiles.h               |  48 ++
>  18 files changed, 1526 insertions(+), 100 deletions(-)
>  create mode 100644 fs/erofs/fscache.c
>  create mode 100644 include/uapi/linux/cachefiles.h
>
> --
> 2.27.0


--===============6289240289155130336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

--===============6289240289155130336==--

