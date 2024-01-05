Return-Path: <linux-cachefs+bncBDLIXLMFVAERBL5M36WAMGQEFWEJWIQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id BC315825186
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Jan 2024 11:13:04 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-d9a541b720asf2112166276.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 05 Jan 2024 02:13:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704449583; cv=pass;
        d=google.com; s=arc-20160816;
        b=TwK0GNNgAg9J6ZkR48hmM9VxYiGVkGwJ83NQd6GYYsoJYWnetTuq0qREbTvMBPKC0A
         noQTawDnJxdV8+Gz8wZV1BW20RkkrQ1IfIUgAdpSB3fX4XDOG3QAzhnnOZCXaAyaOCY0
         EoHdS+K9TXioFclR4VzgZ7m3RHpsjsSURnC03I+Hd2B5fiYazIw4uvSZ42HCVGtNqr1o
         ie715iqoiidEiOeGEJ2YsZ9p92H3Nepskrne+SkqHyt8FAY33qdbKqwiUmnYzfftPwo9
         B8WBdkxHl1PMYddJWkEj90ZQSk+Oyrd2O3Jm+mu1NXFF/normr2Q8vKiKAp/cWXWO7NN
         LojQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=+NuzH4FMJ+ueZ9EO/Akb00HaZUot+yT61sLRlV8/GOk=;
        fh=5l+fFvxKOKoIwul6Y1zzzmXWDgRES562r//eGnX9aQs=;
        b=ExasXdAdt6C+2C0RexXG9Wgntzn1xfZWdWs/Bf5B5Xm6dfNmTYZ5hrWPtpmHzFBpj5
         O9QJVwmkON4n2fKx6AcCLOMUdN90llWEOvLgN70kF0dka12/z/VCplc+4alOZm3jlUA1
         Iq5XIflanAcNxmwIjudjBRCPzKntuDf2zw4znSfRw7SyLTVrhvxPFqvRNXukl6da9RhB
         mMrMvu4cJ+TybRf+2Z/F3bY6JuyLSOgej/pG4k0//LkPn2lge2RyfjBcFXR2bgv/Jteo
         cRwlJg/RY2Td8Nua1fdPoI+xxKudnWQsu36RBbW0wZT+r4wczBVhxUKSCRk5hktVMQAH
         cIlg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704449583; x=1705054383;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+NuzH4FMJ+ueZ9EO/Akb00HaZUot+yT61sLRlV8/GOk=;
        b=S/cEQJUnziaDZx7YXS3lVyny/ICzJ0rkpDGZYUSxrkvNzJOzRnEgebRPwzqmAhc9m/
         wDS+KguialwWcYC/R8nbPK8drTi5hQjUeIW7en3poDI4I9DZK2Kh1lPicZfTVKWyaOUu
         uLg0cI4tYPq+xq8bhU2iatGzP6/5UdxO7zS9vzAyzSwRrjXb6jyzbmFdipINt4rDRXxW
         onBULJ148yiGEMXmvh+kEWRSo76JIY9U9451rJvObyHmAGzEH2cQA0YcgH4K0MBLPz4k
         UX79SR+PenXWWR0iNf11ZisjqquxjUaqVmz6DWzen9k4P32/d7mXh32BJsQq1hDuqbYX
         nkQA==
X-Gm-Message-State: AOJu0YxlQP7uhPGmBSEJy+1EgB8Taqwupg5C2PgG9bYJWZycUQs6GFDc
	PYdBjnh3ljYOOGUXdsQ8Ux/EId7CrPzocg==
X-Google-Smtp-Source: AGHT+IEMaQJO/T3le0d28MDY0Gyn7OrZEWzYrI9/Byw2A+isd9siXiMr46OLU0BvSHRN97Nx97dm3Q==
X-Received: by 2002:a25:dc81:0:b0:dbd:4f8a:72c7 with SMTP id y123-20020a25dc81000000b00dbd4f8a72c7mr1959156ybe.42.1704449583223;
        Fri, 05 Jan 2024 02:13:03 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:d78e:0:b0:dbe:9d11:6520 with SMTP id o136-20020a25d78e000000b00dbe9d116520ls698694ybg.0.-pod-prod-08-us;
 Fri, 05 Jan 2024 02:13:02 -0800 (PST)
X-Received: by 2002:a81:530a:0:b0:5d7:1941:2c1b with SMTP id h10-20020a81530a000000b005d719412c1bmr1790907ywb.72.1704449582506;
        Fri, 05 Jan 2024 02:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704449582; cv=none;
        d=google.com; s=arc-20160816;
        b=u4EcRKUybahcGWK/0MLN8QZDUe2BeGZ6e9+unj7EAfi8veBcg+XPity8f+mpUcRzXO
         a3NrphG7SPzwXp2I/3nNrqbxYyFC6AB9+T+fvgljn+VBz+rDE9Brf+vqStbJJvzKfWMh
         JfQ2e3MgQgYcXwWY5aI+pXr2fdHssmtlYP20BtxWcgjmOe4lIZDv894UfCxxnDvS7MYw
         dNl5Uolr/B97bo2/F/3VxWTgSHEeCjyW75IAULW4Xojr9Z6u4KKrVG04XJjCWqdv5/qG
         dvyBCvwM7un/Dv3589cMoAGPuSGSWf5u4ZPx7dVrlEsw7stlDsgTlYonlfC9QD/8CpNy
         TS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=ZfGJBsmNOnxs6KgxsLMW7K0RfwD6qFO1G6s7pzC6Q1k=;
        fh=5l+fFvxKOKoIwul6Y1zzzmXWDgRES562r//eGnX9aQs=;
        b=L3/95qSrR0gI2ztJUZrjhjsZ0tDlM6WtnBIrlOy0KK++KeH0p3YwViyzAvBttJWvE7
         9yz5TH6KroIm1rKz1M0ZhIO6bTEtN7jOH8b2Xs/21nsdjWc/nXrMieDPfUVKW1c44yrO
         9M5A/fzk/GTVEn/rfIOqwS5HStvx4zfiqh3GJrlKmXU52pVPqfyqVgwCuRRHjXztAMuh
         ni0+vgoSalnYaTYDr96+dYDp6l6dSz0S0wrzcYjozET5GGTC115oNwUZPnvixdA5uQzs
         5sEi1Ef41lRg9n2rjya0o4qj3zjnHqb76LnpjalcfTWJXYR/Ws5A2Ts+t6A69C/yjDyk
         HNZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id i5-20020a37c205000000b00781efd5bc94si1386169qkm.12.2024.01.05.02.13.02
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 02:13:02 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-SZqyJaEQPU6egW_xtElFjA-1; Fri,
 05 Jan 2024 05:13:00 -0500
X-MC-Unique: SZqyJaEQPU6egW_xtElFjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1EAB1C05149
	for <linux-cachefs@gapps.redhat.com>; Fri,  5 Jan 2024 10:12:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EF0F640C6E2B; Fri,  5 Jan 2024 10:12:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96FAA40C6EB9;
	Fri,  5 Jan 2024 10:12:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZeLAAf6qiieA5fy@casper.infradead.org>
References: <ZZeLAAf6qiieA5fy@casper.infradead.org> <2202548.1703245791@warthog.procyon.org.uk> <20231221230153.GA1607352@dev-arch.thelio-3990X> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-38-dhowells@redhat.com> <2229136.1703246451@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com, Nathan Chancellor <nathan@kernel.org>,
    Anna Schumaker <Anna.Schumaker@netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix oops in NFS
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 10:12:55 +0000
Message-ID: <1094259.1704449575@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1094258.1704449575.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Matthew Wilcox <willy@infradead.org> wrote:

> This commit (100ccd18bb41 in linux-next 20240104) is bad for me.  After
> it, running xfstests gives me first a bunch of errors along these lines:
> 
> 00004 depmod: ERROR: failed to load symbols from /lib/modules/6.7.0-rc7-00037-g100ccd18bb41/kernel/fs/gfs2/gfs2.ko: Exec format error
> 00004 depmod: ERROR: failed to load symbols from /lib/modules/6.7.0-rc7-00037-g100ccd18bb41/kernel/fs/zonefs/zonefs.ko: Exec format error
> 00004 depmod: ERROR: failed to load symbols from /lib/modules/6.7.0-rc7-00037-g100ccd18bb41/kernel/security/keys/encrypted-keys/encrypted-keys.ko: Exec format error
> 
> and then later:
> 
> 00016 generic/001       run fstests generic/001 at 2024-01-05 04:50:46
> 00017 [not run] this test requires a valid $TEST_DEV
> 00017 generic/002       run fstests generic/002 at 2024-01-05 04:50:46
> 00017 [not run] this test requires a valid $TEST_DEV
> 00017 generic/003       run fstests generic/003 at 2024-01-05 04:50:47
> 00018 [not run] this test requires a valid $SCRATCH_DEV
> ...
> 
> so I think that's page cache corruption of some kind.

Is that being run on NFS?  Is /lib on NFS?

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

