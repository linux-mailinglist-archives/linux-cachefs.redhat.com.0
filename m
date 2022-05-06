Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20951D386
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 May 2022 10:38:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-GyB2qcksNqOc2N_VZ3aeqw-1; Fri, 06 May 2022 04:38:34 -0400
X-MC-Unique: GyB2qcksNqOc2N_VZ3aeqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0155D2999B43;
	Fri,  6 May 2022 08:38:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B15440C1247;
	Fri,  6 May 2022 08:38:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5F0B194705C;
	Fri,  6 May 2022 08:38:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5858E1947056 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  6 May 2022 08:38:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C9B840C1247; Fri,  6 May 2022 08:38:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38C964010E56
 for <linux-cachefs@redhat.com>; Fri,  6 May 2022 08:38:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2134486B8AE
 for <linux-cachefs@redhat.com>; Fri,  6 May 2022 08:38:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Niv1A7sGO-er4mCqEr2x_A-2; Fri, 06 May 2022 04:38:28 -0400
X-MC-Unique: Niv1A7sGO-er4mCqEr2x_A-2
Received: by mail-ej1-f42.google.com with SMTP id dk23so13113654ejb.8
 for <linux-cachefs@redhat.com>; Fri, 06 May 2022 01:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EBkH1YgBBg5lHtmXPTC9d6coG0adV0HCM1ShUIWoEoc=;
 b=JF/NocYAhwBfSlviWElz14uv9iA7HLivgyoK87i6LJefZyUwCyTZQ36H2l4F04Bymn
 bYO1skfW+TSvk9INEfieR1u/sALL3Bc5W/0jmqvyaUPAlstPlju6ML+FMFavOUhEp1h/
 RuIFe+q88TnIwkWnKR3pe+iiMKxQ8MFDsLqcXU0chpxTbc8ssdr+WE+sjyCSN9vgEkE1
 fRpwMUNATta9JQjo+gHCCuGzg1LS7VeqmuQhnqyhGR3D1UJSbOPOvSUhhRoZGF9mTb2G
 L43b660seEqAEJ5p3sgsf/Pum3UYNTGqzsyu2pNdY7FYODkWJf8K8zSxT/68MML1txw8
 c8zQ==
X-Gm-Message-State: AOAM533oRBPC6ARrYDOEsBwk69mEPPxFCFBoIoLAGpnkQCKAHyBJAGrb
 NFuMdxiosxmCc2ZEIpab8FqCkeguhWxNEjgow0W+Iw==
X-Google-Smtp-Source: ABdhPJwufJaMAM2+MNOlVHAYPUzuPaCimo02YkmbADJ6ehIimaOWceDQz6W4LctqUXiCnzrmfjiFrEPSoDWSynLdYOY=
X-Received: by 2002:a17:907:1693:b0:6f4:ee60:16e8 with SMTP id
 hc19-20020a170907169300b006f4ee6016e8mr1858054ejc.312.1651826307950; Fri, 06
 May 2022 01:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220504132106.28812-1-dwysocha@redhat.com>
In-Reply-To: <20220504132106.28812-1-dwysocha@redhat.com>
From: Daire Byrne <daire@dneg.com>
Date: Fri, 6 May 2022 09:37:52 +0100
Message-ID: <CAPt2mGMQ2x_aQwr2W18xX5LfUy6q118QxVqhdC663ZtUjZehdg@mail.gmail.com>
To: Dave Wysochanski <dwysocha@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH] NFS: Pass i_size to
 fscache_unuse_cookie() when a file is released
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
Cc: linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-cachefs@redhat.com,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 4 May 2022 at 14:22, Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> Pass updated i_size in fscache_unuse_cookie() when called
> from nfs_fscache_release_file(), which ensures the size of
> an fscache object gets written to the cache storage.  Failing
> to do so results in unnessary reads from the NFS server, even
> when the data is cached, due to a cachefiles object coherency
> check failing with a trace similar to the following:
>   cachefiles_coherency: o=0000000e BAD osiz B=afbb3 c=0

I can confirm that this fixes an oddity I had noticed with the "new" fscache.

When running an fio read benchmark, if you remounted or dropped caches
between reads, it seemed like it required two initial reads of the
data (and writes to cache) before all subsequent reads would come from
the fscache disk.

Tested-by: Daire Byrne <daire@dneg.com>

Cheers,

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

