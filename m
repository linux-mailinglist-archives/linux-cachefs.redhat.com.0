Return-Path: <linux-cachefs+bncBDLIXLMFVAERBXHVQ2WAMGQE7EZ3Y5I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC2818B7C
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 16:46:37 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4259975e20dsf53349951cf.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 07:46:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703000796; cv=pass;
        d=google.com; s=arc-20160816;
        b=g3u0ti8Nt2ZHqZRXy/O++texDvwp1hyTPKR2VhlJGrSr1Y4vt7I4qD6OPRKDqKFs74
         b95Bvj+u76DTBmbEfjOwqEb/GzNQpiFZWYEtveatWfnObDlE1r1u5gIWyXGxKrxyYrqz
         w6XAAyAXKrf+8h4ge1vML7npnYOyugYN4YuVxtZJc9wGpKodS+JRN5Drct8puLrW4Bwb
         vy0nnInAdz3yxeIp0UTPxj75Bf62rIl3ytif+oWDREly4x9EZUVpN+0GIgZEncQyasNB
         ePzw4fdUMnllp+V2CawxFwxGJHpl1yQTbXh+fypV0dAZy7pC/o5fOWfbJr0SsHWexSrC
         Cafg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=/nLsKsnZa/tti31eCFCqq7Ym4zRVduPfmbmt33qbDlE=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=DPUJ9Ko3B6BDSZWBWe3sWZ0kMIGPCmaXQapVbYpv5YhRcBeJCB9vSkWw+XYvv7wF42
         pTlksvnHG6mIlwlm2Dh+g7r2bIiLjkn78s3uElaBCVDb7X9bLdrm6h6CbP5cRYfmyEtJ
         u8WG5fDVORB/X5A0JBEIEjgeAan7j87I20O1tnQxkSYltQXcb/lDlTsqu4sbIfZI5aHw
         PtVrzlyxMHAZ1jxtwPbyjaGtj563k3gekbOQ0vOLQyEoH0t10cLOwZwG0znpXn+m4JO6
         tq3zfksfk/YImOQQu5OnJQUtlYCB7JUJfgjqbFsZN+2mM7Y0aqPT1D20oBa8zdVzPayD
         GtlQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703000796; x=1703605596;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nLsKsnZa/tti31eCFCqq7Ym4zRVduPfmbmt33qbDlE=;
        b=WhyfFE2TDtSLcm6tiR6fg4/xQ9UKtaAThnwDIit+hWA3rMBmPzXcoliAEqR5i77V3l
         pcJUPtlKI1n1XG0l9j080CV6mm23dSVYaX0FSM4To/DIOIMoXsoUXKqiDb/HDYDsAVUv
         aBrVs76ZHFs8JZlrsf+UcttI38zktPvmSB7dIOG2oN9LisKF24lHAucMprVdikwmdDQ4
         7Asyc0vfS9aYP+TTiXcT8J6OGRmWOSUDv556ZhjH/1WMkxaeiV7Jvh6FdEp8Rr8nhBMo
         wETsQZZrGcjCkikLhwiSF+qvAUWGHBaoBAlBlwSR24bR5oMYor9mC0Ej7+IOfgv0UL7m
         tlZw==
X-Gm-Message-State: AOJu0YxLvzTfzuNCjUy+8LhESNCTFKYGPYOoSXFj2cJSB/SsYzNZ+RSm
	KR/wfKHYDqhclYmKC+thren/rA==
X-Google-Smtp-Source: AGHT+IHw43RSYaJlynBCrpNziBaMSM34SzkYqKoQrosgOLh+a21BpXin63C2fkvd/SrlXQcfU+G7ZA==
X-Received: by 2002:a05:622a:18a6:b0:425:4043:8d42 with SMTP id v38-20020a05622a18a600b0042540438d42mr13962525qtc.93.1703000796540;
        Tue, 19 Dec 2023 07:46:36 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7d05:0:b0:427:7e1c:8ea3 with SMTP id g5-20020ac87d05000000b004277e1c8ea3ls732758qtb.0.-pod-prod-08-us;
 Tue, 19 Dec 2023 07:46:36 -0800 (PST)
X-Received: by 2002:a05:622a:307:b0:41b:7773:ee56 with SMTP id q7-20020a05622a030700b0041b7773ee56mr17354896qtw.50.1703000795856;
        Tue, 19 Dec 2023 07:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703000795; cv=none;
        d=google.com; s=arc-20160816;
        b=VtkEGKAm1QKnurZqheAHwEYWh50Llz4hx8u8OoJHYS8+vgC2PC9uujaLeBGBbF16IN
         hfZQ0xZxAJaoo5GO/X3qd5E2ZhsuIozu298BQaonYSCwbqKo3+AqAXjAW70VDfPFG37J
         ohJWNyV/5ScmO2cLWAkRF0m2NEJKVajzsMwq6xNq4CkfuVOJCObuC04CbPVYOT/m041p
         MmDK89stI4mSXovIymiAMlVWqvYRYdH5PQaewKL4iBwirKPgmGt5a3+7qwuXGeuEq9iP
         xNTi98fzBPbrzaEdMNDodcEqOLNI7TO5KLXxw8ITMfL3KJjOY7F30NUdiu4itm9l9pjF
         a+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=wZJGy675CLReZdRFDQqYih3Khpsr0+z+wYGm8WjxUuI=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=mdtl4Rx0K4Lf6mRP7eVNu8zVaHAgoHgaGRtTdak2fz9wrWttRA+4EchPTqlsJjDorr
         CVZtA2C86hG77Npqh2S4fY+aaT/bf81TNxrKuSENZHc/amxKXr4Ma7brzW8mMLZD+lak
         wVCNxbaWV1jMgzWu7AYdBZsIq7iRXswp9+m1u6vR/+8cX0jwlbz5/HyG5/lUdzLddJJR
         pWTjDRe3cIiVQuLEvS+b7HY3ZOaaIW917rR+6hgsoCOdrYp5ST9LOzwPe5HsTnmuDxnL
         /D/8wb6FerYsI8JAMQfMg6BPWV4GgenghNhWyH8f27WubisLmYaE+D5QQY6y7VIj+HHz
         7qvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id f11-20020a05622a104b00b004276175cda7si4805256qte.136.2023.12.19.07.46.35
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:46:35 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-6648uLy9OpmtCHwlUXcDpA-1; Tue,
 19 Dec 2023 10:46:33 -0500
X-MC-Unique: 6648uLy9OpmtCHwlUXcDpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 991AD3C0E647
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 15:46:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9591A3C2E; Tue, 19 Dec 2023 15:46:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5C1E3C25;
	Tue, 19 Dec 2023 15:46:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <36ba1d9f8668e701a9eebcc6cbaa9367e7ccb182.camel@kernel.org>
References: <36ba1d9f8668e701a9eebcc6cbaa9367e7ccb182.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-29-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
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
Subject: Re: [PATCH v4 28/39] netfs: Implement support for unbuffered/DIO read
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 15:46:28 +0000
Message-ID: <844305.1703000788@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <844304.1703000788.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

> > +static int netfs_copy_xarray_to_iter(struct netfs_io_request *rreq,
> > +				     struct xarray *xa, struct iov_iter *dst,
> > +				     unsigned long long start, size_t avail)
> ...
> > +	xas_for_each(&xas, folio, ULONG_MAX) {
> > +		size_t offset;
> > +
> > +		if (xas_retry(&xas, folio))
> > +			continue;
> > +
> > +		/* There shouldn't be a need to call xas_pause() as no one else
> > +		 * should be modifying the xarray we're iterating over.
> > +		 * Really, we only need the RCU readlock to keep lockdep happy
> > +		 * inside xas_for_each().
> > +		 */
> > +		rcu_read_unlock();
> > +
> 
> Are you sure it's still safe to access "folio" once you've dropped the
> rcu_read_lock? I wonder if you need to take a reference or something.
> 
> I guess if this is a "private" xarray then nothing should be modifying
> it?

It is a private xarray in this case.  The only reason I need the RCU read lock
is because the xarray code will complain if we're not holding it:-/.

Actually, I can probably excise the bounce buffer code for this series as
nothing in 9p or afs currently uses it.  It's needed for content crypto - so
ceph will need it.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

