Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CECFD42C52A
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Oct 2021 17:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634140054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EQ57PbunVF/e0UD9xkggDiGfedt7YTXn7HyAkV4ukwI=;
	b=F3A45HVn9DaakmWRtejyiKUO0WZlvnZj5lC1Ul4HqI4yxAk4I2Li35yNSY3UruKgk6+mHV
	owoQc4RluB9/5JIcU2U2k3tTAApFFpRC6F+GgC9PSUROz3dhB5wOwYtywvyLM0sBqShsv0
	vB9XDv+nmH36T/zYge07p82jKTk2jew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-UqsKPMlKOwG5sIMqrWpCnw-1; Wed, 13 Oct 2021 11:47:31 -0400
X-MC-Unique: UqsKPMlKOwG5sIMqrWpCnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E4385074B;
	Wed, 13 Oct 2021 15:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 428F760FB8;
	Wed, 13 Oct 2021 15:47:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D0761800FE4;
	Wed, 13 Oct 2021 15:47:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DFfwPr029695 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 11:41:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBB08400E410; Wed, 13 Oct 2021 15:41:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D853140C1256
	for <linux-cachefs@redhat.com>; Wed, 13 Oct 2021 15:41:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C01A91066684
	for <linux-cachefs@redhat.com>; Wed, 13 Oct 2021 15:41:58 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-VYJpHWW1OuGX6tejUbmBng-1; Wed, 13 Oct 2021 11:41:57 -0400
X-MC-Unique: VYJpHWW1OuGX6tejUbmBng-1
Received: by mail-ed1-f69.google.com with SMTP id
	d3-20020a056402516300b003db863a248eso2590976ede.16
	for <linux-cachefs@redhat.com>; Wed, 13 Oct 2021 08:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YTsyQy90Y8vr99gRcn4sruIL3K1xPoiLMle2l3qSL3o=;
	b=4xuRwBMPWRvQgDVzvJv3i+4wOVmJPqUdGoZQLTzLfZMr+zXOzRZjavMpKcQKuAC7kd
	VNE+ZrHdKfwmyzHJi1XirGI+laWqVLlBdpIPFiQSGLkqp1O4k3PY4wah4lnz/KGgpc7i
	Po4DWeym2ZMlTZeTVhu4sbVTfnUnTCcrujtvzdzpLGIPd0dQ0hFZuz7ndLzNj6Z2/c9X
	zAGWNgwuuV+MsAq8Sm9DWnzUWmscUluj5oBz3YlkQL9u3+NE1iRyTmfG8yQOm1G1Snep
	1J90+8B9Dye7JO404WITGv7Kx1iqG7zvi0gkCMb9VRQLLwcuxJ5VT3FrrnUd1uRlLw4t
	vrug==
X-Gm-Message-State: AOAM530AElRkk7pzdLiY6KI9eIF5VY5fCoWs/tfeh9E/ug2L2oZpE4nN
	mpbBO1t4lx7Gw8TDjlyIdwHbTLI0Dpt2vTtwLPozBWzGXynjItYa4+S+yK4li6jJAci48EuroLv
	YLKxESlrIbNwAkq6CrUNTE6H6vwtEmSBRJTUbyA==
X-Received: by 2002:a17:906:5e17:: with SMTP id
	n23mr286523eju.258.1634139716209; 
	Wed, 13 Oct 2021 08:41:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS4cVAWJkR7CbLvPFTXBfnS1sSmTtIpe5zZADoFU1ojmR6bmvi0WKIMzEMMmw+1gYr2qY6GVDMz+QhDc7rPLw=
X-Received: by 2002:a17:906:5e17:: with SMTP id
	n23mr286493eju.258.1634139715963; 
	Wed, 13 Oct 2021 08:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1633645823-31235-1-git-send-email-dwysocha@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 13 Oct 2021 11:41:19 -0400
Message-ID: <CALF+zOnyGNG=wUHu2j04RWF0nQaAoQfse5e81a=U3pvdNXL26w@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] [PATCH v2 0/7] Various NFS fscache cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 7, 2021 at 6:31 PM Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> This patchset is on top of David Howells patchset he just posted as
> v3 of "fscache: Replace and remove old I/O API" and is based on his
> fscache-remove-old-io branch at
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-remove-old-io
> NOTE: fscache-remove-old-io was previously "fscache-iter-3" but it's been
> renamed to better reflect the purpose.
>
> The series is also at:
> https://github.com/DaveWysochanskiRH/kernel.git
> https://github.com/DaveWysochanskiRH/kernel/tree/fscache-remove-old-io-nfs-fixes
>
> Testing is looking ok so far and is still ongoing at BakeAThon and in
> my local testbed with tracepoints enabled via:
> trace-cmd start -e fscache:* -e nfs:* -e nfs4:* -e cachefiles:*
>
> Changes in v2 of this series
> - Dropped first patch of v1 series (dhowells updated his patch)
> - Don't rename or change the value of NFSDBG_FSCACHE (Trond)
> - Rename nfs_readpage_from_fscache and nfs_readpage_to_fscache
> - Rename enable/disable tracepoints to start with "nfs_fscache"
> - Rename fscache IO tracepoints to better reflect the new function names
> - Place the fscache IO tracepoints at begin and end of the functions
>
> Dave Wysochanski (7):
>   NFS: Use nfs_i_fscache() consistently within NFS fscache code
>   NFS: Cleanup usage of nfs_inode in fscache interface and handle i_size
>     properly
>   NFS: Convert NFS fscache enable/disable dfprintks to tracepoints
>   NFS: Rename fscache read and write pages functions
>   NFS: Replace dfprintks with tracepoints in read and write page
>     functions
>   NFS: Remove remaining dfprintks related to fscache cookies
>   NFS: Remove remaining usages of NFSDBG_FSCACHE
>
>  fs/nfs/fscache-index.c      |  2 -
>  fs/nfs/fscache.c            | 76 +++++++++++++----------------------
>  fs/nfs/fscache.h            | 25 ++++++------
>  fs/nfs/nfstrace.h           | 98 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/nfs/read.c               |  4 +-
>  include/uapi/linux/nfs_fs.h |  2 +-
>  6 files changed, 140 insertions(+), 67 deletions(-)
>
> --
> 1.8.3.1
>

Just a report on the testing of this patchset, which also tested
dhowells fscache-remove-old-io branch.  Overall this looks very
stable.

I ran some custom unit tests as well as many xfstest runs.  I saw
no oops or other significant problems during any of the runs.
I saw no differences in Failures on xfstest runs between 5.15.0-rc4
and this set.
I ran the following configurations of servers and NFS options for the
runs (5.15.0-rc4, then 5.15.0-rc4 + this patchset).
1. hammerspace (pnfs flexfiles): vers=4.1,fsc; vers=4.1,nofsc;
vers=4.2,fsc; vers=4.2,nofsc
2. ontap9.x (pnfs filelayout): vers=4.1,fsc; vers=4.1,nofsc
3. rhel7u8 (3.10.0-1127.8.2.el7): vers=3,nofsc; vers=4.0,nofsc;
vers=4.0,fsc; vers=4.2,fsc; vers=4.2,nofsc
4. rhel8 (4.18.0-193.28.1.el8): vers=4.2,fsc

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

