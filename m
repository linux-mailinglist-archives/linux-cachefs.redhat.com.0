Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRWL6SYAMGQEKLDZKVI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A88A503A
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Apr 2024 15:04:07 +0200 (CEST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6993c176044sf75290286d6.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 15 Apr 2024 06:04:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713186246; cv=pass;
        d=google.com; s=arc-20160816;
        b=nupcCucFbrMYqnXxBzirdN5ZqMEI1fVvLDyLZ4q8OiqN0oFci9yTPCXDL1hjh7+Vbu
         cdu1mETbqLyGWWpVpqjhG3SddqS24Cx2nKxOdoHrMWm7PcG3VUEIV86+fxUtN8sZakFU
         UUT2y0s4970wF87JAKBdD3DYN9neSG7o+E+ot/V0Z+fQpJuVgqi+EC7uK0lrbnSOU4eg
         lnmIRvu3twzrzp89GsvRsunhxioF97CNSm8rooPdQmMr1TYr8hGRlVrpvvf7JuaQvlkM
         XI70vO9Ma/FB/l2p6wPzPgrptyFYaovo4Iy/eruVFpcPiWhHTq8PXHNgMk4a+vHfYriC
         1HmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=Tx9y2NmcA37kgroW7MErhTG2eLGhbdQzxITmG+YMfpQ=;
        fh=SEbgSgnZ4n1YZWhUrrKE41fvduA7BER4By/I/+NwVYU=;
        b=KbQ2sM73pSadB+x3bATx2daaB2LdRhP1/6vG6rif3FNBEIofTxse1XDc1XmPL9fOP8
         hxV7bjOiTEqp0jWPlqNVskiqviKKyIkpjxQbIFtCA2dXyGWOQGvb5SLLxTZIH2UcMlJK
         kqJoyJ1zJ082GMEUsnUW6I516CYrii1HhhVZlbi6x+Yh9G6uRCuzQWj8gkOycrNb6NIl
         ccuOtTlh6AKphJwXswQ8QbOO9SDNineIb3Iv3jjTfJ4RtDWSMpumc/o0lR1/pBsuQeW7
         gAy2mUlBjSz92ZCGVgV6qk3OA10Z4KFAzikGphk+0RSpr0fST7vSG4oW72WBQqWkUFtJ
         6qkg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713186246; x=1713791046;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tx9y2NmcA37kgroW7MErhTG2eLGhbdQzxITmG+YMfpQ=;
        b=rsPdKH0Wz6vf3eSjTW+FoNAPG89W7lyYVadaBaupVjMbVoXTjN3ozUW2tIeXpv+ylL
         JXln1y+ZOKCaag/t+N/lZdsZ3qqj9yxJvvWEfk6AcHoZ2NFBTIJXpVdt8upU47q3HL9Q
         pBW5S1/QYX29GP1/ZMvNJNW9tUDQ2j3Z+EEtjMHKkd9BXWTu7Y0eW/ro25e6Aj/gYsQV
         Omfzo3Vr4YLWgnpffaxvbmHkreiiLGvgQwdOm7ApRLqXN2qetC8yo7EM8l9x4KN+KEFd
         S4eg+o2mUbWImsIgsNxS0PDo0wdHFz6rd+Q6RsBdaH0aQqgyK4rJzmp9p9fVv7gy6eyk
         TncA==
X-Forwarded-Encrypted: i=2; AJvYcCXEbNC9vPFqxVnOKGbiZ28lBiCaSSIezfbxOVaDWrG5SKNgvZBRk4Urx2MrodsoJhPVn6KyUrwOmyGa5sPolZ1sAFQzoBxr7ERZbdk=
X-Gm-Message-State: AOJu0YyIeMHrSszAZFwTMfm1gLbQMgOi0JLHdcPCSH2ppUp0MkX8k95F
	Rw60wClLxngs9klZiZGdsdFp/t4XYJeZrREkolMDfiAIhEu080SzPK7eFeA7wcQ=
X-Google-Smtp-Source: AGHT+IH/ot0JyMX0rAkjLNS7CfEpvZelZByfJkJHvI4rrsCjNAS5c7NFfNpnQGgn3nLgeRLNYnbgkQ==
X-Received: by 2002:ad4:51d1:0:b0:699:3da8:f89d with SMTP id p17-20020ad451d1000000b006993da8f89dmr15103993qvq.0.1713186246323;
        Mon, 15 Apr 2024 06:04:06 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2689:b0:69b:a44:bb68 with SMTP id
 gm9-20020a056214268900b0069b0a44bb68ls6821631qvb.0.-pod-prod-00-us; Mon, 15
 Apr 2024 06:04:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUc0rXzyZFUfsHrdVWKIzeSyjICJLAjmGQYfxanE7vUt6txNgHktBTif7nPR9zVkaKWsxhJHWDdtAGjvWtkzyWYidAxy2QwvCFfFNczzgQ=
X-Received: by 2002:ad4:4a08:0:b0:69b:7363:92a with SMTP id m8-20020ad44a08000000b0069b7363092amr6242482qvz.8.1713186245256;
        Mon, 15 Apr 2024 06:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713186245; cv=none;
        d=google.com; s=arc-20160816;
        b=wFFYlHguGsmhD58OiCslB9nPfJppOKNzRvvAEV9bFACwl2X8mpu/u5NqyZeBW1WDji
         GQ4bnRoTrQSw/fW5TXxUWdzhtHsm9pRz5771vtRycqnud9Y6d+ThLWourvbYn0XFMph1
         valR08/Ir/DQaeA2c6GLZu7QET1COuqm01SZYV78NNxFYP5mgHNLJGUXtln6uaQI5fVS
         6qDO7U//UtQ778GHy2Cca0GRsvvB4lwD/J/zmDzWG1D8x+sM/dSmoPz1An8oc9PkRBso
         tXKREfl/ZGuxwPg41XJX6rbnr3DzJLaRq/8+zh4mppg+FCb5W8gNc/LSNw+SC961bTCf
         nePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=+Ptvnzk1WkI8ph1+6mQtrYI+ziVGUn1LcaZGMSp9/x0=;
        fh=2/oUan3/SY46zlzXjlk1LikiWiQopetIpsetBnZdtnQ=;
        b=yZxE5bDRX1JQe0Ta6SEdMFypR6bcKfc+DxBKB0JtKQgUkh4+t/OrJsXyoKpaXg6joW
         LrLxqiWKy2pt+Ut8X7y0JSziNAvdtu+yQlFd1XgqMGCeXKOgPKJ2GtrLdWKiKgz5LHYg
         GZwgcWTqyBQqIDhX8nGuU6VaU3RD1Yvwi4iwif2/th/eDX4pog41gyisxmvqF18LYBIP
         l0EQPV8apkMZProRtyrY6hzBOIrXGqxExULXx3hPOh6IyWBHoCjmCjT0UCjsc2rKulkg
         qqWwzEKHPgDRk+6wNGttSutQ5xsYz8PpzyTXSshRMS5ofC3Wci9SFgmpr6vEPGCozvDN
         BXYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id e18-20020a0561020dd200b0047a50dd3ff0si1118442vst.23.2024.04.15.06.04.05
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-YUXJztv0MLGZmeA29TG7jw-1; Mon, 15 Apr 2024 09:04:03 -0400
X-MC-Unique: YUXJztv0MLGZmeA29TG7jw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3111380A1B9
	for <linux-cachefs@gapps.redhat.com>; Mon, 15 Apr 2024 13:04:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2D831492BCA; Mon, 15 Apr 2024 13:04:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 367FB492BC7;
	Mon, 15 Apr 2024 13:03:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <39de1e2ac2ae6a535e23faccd304d7c5459054a2.camel@kernel.org>
References: <39de1e2ac2ae6a535e23faccd304d7c5459054a2.camel@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-2-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
    Shyam Prasad N <nspmangalore@gmail.com>,
    Rohith Surabattula <rohiths.msft@gmail.com>
Subject: Re: [PATCH 01/26] cifs: Fix duplicate fscache cookie warnings
MIME-Version: 1.0
Date: Mon, 15 Apr 2024 14:03:54 +0100
Message-ID: <2345944.1713186234@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2345943.1713186234.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

Jeff Layton <jlayton@kernel.org> wrote:

> > +struct cifs_fscache_inode_key {
> > +
> > +	__le64  uniqueid;	/* server inode number */
> > +	__le64  createtime;	/* creation time on server */
> > +	u8	type;		/* S_IFMT file type */
> > +} __packed;
> > +
> 
> Interesting. So the uniqueid of the inode is not unique within the fs?
> Or are the clients are mounting shares that span multiple filesystems?
> Or, are we looking at a situation where the uniqueid is being quickly
> reused for new inodes after the original inode is unlinked?

The problem is that it's not unique over time.  creat(); unlink(); creat();
may yield a repeat of the uniqueid.  It's like i_ino in that respect.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

