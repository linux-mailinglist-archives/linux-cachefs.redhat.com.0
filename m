Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7WWQ2WAMGQEDAPOPWQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id B037A818A3E
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 15:41:03 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-425bf20d5bdsf10900171cf.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 06:41:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702996862; cv=pass;
        d=google.com; s=arc-20160816;
        b=KPSXwAws0asRkvedcB85drmbyirWt9BjfxrElq+rFPHF230OXAixQVxTNLYqiV6saV
         7GMwjnaHnn9kG3hrEOl+uNk95wnPKRYLu+godoi6d1LVZUe2hmsSll1yjmPragkAp86l
         7LZM+n3/fLMbeB43mHH3hoZii7p3Gks+W9nC7z0zMvfeTNnqJymqWnnhb2+uuG/9Y/Il
         22eF5B9k22Ds3qASPlgH2W0qnfGSlZDHAEzxkkvtyVI3SnNBhfPgebi8Hj+GXOnxG2O1
         epnTeAUor5mio56utt7RspfOXDPOKRC7M/a+pYq+FXoMWziZi5TnCtUxHBXgpqdNb2W7
         +vyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:references:in-reply-to:from:organization:delivered-to;
        bh=0BeJ4NX0pGMkG7JRx4h4A6YeNDoBr0mERlrModIfXAo=;
        fh=ckrmdHwgG2JpVSyLZ8b1S4bItEWLTIIEgGqKCL8CUEo=;
        b=0S+hBfoqMvWDOqs+eOD8YJ1Y15rOfncTOfnE4KIOoRcsux5o9bGdj6G8ixmV8U5ZPR
         eYj16fBClRr36PbvioBHsZ1NBQjmBlG/K9phFjwZ57KY1w0pflvQivJwa7dvVrKih0AA
         /MnWH/VwgZhwAVP/KzyZEhClOYYPBiKinT9l8oY8hqmdx/J1vb/V+SczSSmsILc99YwU
         yHOjKEl8fs0tIv4sDOyISyor9HtguzswM/9PKmBoaIoEwtfA9qpYQdsbNNkPDYIzm9uZ
         kR+P5x3iZbqjX0Q0boXRJXUxYfW++4tmUdK4O0YKCLwk8JLc8M3aL7jF852QVYGXVZIj
         4l6A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996862; x=1703601662;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:references:in-reply-to:from
         :organization:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BeJ4NX0pGMkG7JRx4h4A6YeNDoBr0mERlrModIfXAo=;
        b=vMxJRWRls7NisyrGoQZmIwwa3e6AYeo8H1S5xlzS2s3IqoNootzQqZi+NeDG3dpMsg
         8OdG/q+Pt4qkUTnd0s+vYSuibZtlMkmM5a6nJyD9soIPfdlG6Lfr3ofNhBdJeOzBvauU
         G395TmbattgKdpOr5BqcOmZocjvEciy7MUChVHycNE72PjNQeNOcIAJ5Z73gfWBsOBTL
         9ylFgl2WQqve1qwo+wEt8n2KzPYIC/4xhN3j64g+kNXVbohXbkrsSEo2sbyxkWQ0FBzv
         kIQEz+VBX7bdj8OyaqdHcDQgtITLseyY+Riub737nyCTv4OX0gb+/h2agj1A3fdJPbq9
         PawQ==
X-Gm-Message-State: AOJu0Yz12fZK+8+a2rBIyqbfJ2XNi/HcaM08Fh7SUJjbS6VSp1mFO1e/
	GHfTVPcDGZH+IeVFEzF45b01KQ==
X-Google-Smtp-Source: AGHT+IGK2WRTp2RA2ghfYwKQH0H+xd6X/A4KpR8EtTnxvXTH8iIHAqMxl/qzrnoPVObQtLfZur6ITQ==
X-Received: by 2002:ac8:5f4f:0:b0:403:c2fa:83b with SMTP id y15-20020ac85f4f000000b00403c2fa083bmr36918022qta.4.1702996862464;
        Tue, 19 Dec 2023 06:41:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1887:b0:426:1d69:fbbc with SMTP id
 v7-20020a05622a188700b004261d69fbbcls4521654qtc.1.-pod-prod-03-us; Tue, 19
 Dec 2023 06:41:01 -0800 (PST)
X-Received: by 2002:ac8:7e89:0:b0:425:9f4e:3121 with SMTP id w9-20020ac87e89000000b004259f4e3121mr20109981qtj.69.1702996861812;
        Tue, 19 Dec 2023 06:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702996861; cv=none;
        d=google.com; s=arc-20160816;
        b=vuhTwLxabKsHLge+zunn3ry6xDhiQG33wXDsr+MMTn/EG/gb7xCPZuS6HB+VKwsJSR
         ZQr1JLs97CNtAw4PSKgVzjUwhlgBH22gGkeH9wGK75ImZzhBNFMFjhVxEKdm0AoPHy6C
         KRzqaCkgefP6pBijsaS8lwo3h2RmV62kGa0iODjBMPTgvENCbr4LJb+9hVrdTR/4eLK+
         PNU0mety1mArJEQK3Dz96Qg6Xc7msMVHC2gZv+1FmZoi09bUd+KOPZZfuglpALFFzj65
         KnOgCv+ksBaoONdu9HSy1PS5iO7wzza7Tan9GPMutJzVi7nbXVnmG4rm6ql3lw4TF2mN
         FETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:references:in-reply-to:from:organization:delivered-to;
        bh=n2tDSMWyb2kYjVMHvRVIwfA/bpH1M+zwEGiFbqzxKRY=;
        fh=ckrmdHwgG2JpVSyLZ8b1S4bItEWLTIIEgGqKCL8CUEo=;
        b=kfuY2fyXTKqwRVynSWaQ2xzhX4+iTNr6q0pEv5Qw3zlf04WLytxCo/DIUNL/xEa/8Q
         OYakA2lboeCwRie981xG93kIZidZPHhKTVmw1ntzuN1YGslbip1tPye4sJ8DqtHd61bk
         MPD3ng5Gh4OcJhUyUV8/0lraaC87vRcKZAyUBkCLhtW2Fn2pW+GQkIVXt6611xGBBkNL
         kQckvUR0NEGrRY4O+kcm+20NObAj2WOp2W/yJ7ZcV+7gLdtFBQH/cLV8WJ5rtGyC4vFI
         vdAbP1jj0mBWtzocIc++zy/MhDBF0wNHNJXzKf9UV2PQHZHDnx0+sITNi8tKcIXBC0v4
         VCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s14-20020a05622a018e00b004275196a0eesi7466693qtw.46.2023.12.19.06.41.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-s035QWOhOcqlAftwvwAO5A-1; Tue, 19 Dec 2023 09:41:00 -0500
X-MC-Unique: s035QWOhOcqlAftwvwAO5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC293185A785
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 14:40:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E91A5112131D; Tue, 19 Dec 2023 14:40:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27B1F1121306;
	Tue, 19 Dec 2023 14:40:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <488523.1702996313@warthog.procyon.org.uk>
References: <488523.1702996313@warthog.procyon.org.uk> <367107fa03540f7ddd2e8de51c751348bd7eb42c.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-13-dhowells@redhat.com>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
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
Subject: Re: [PATCH v4 12/39] netfs: Add iov_iters to (sub)requests to describe various buffers
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 14:40:56 +0000
Message-ID: <488794.1702996856@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <488793.1702996856.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> > > @@ -88,6 +78,11 @@ static void netfs_read_from_server(struct netfs_io_request *rreq,
> > >  				   struct netfs_io_subrequest *subreq)
> > >  {
> > >  	netfs_stat(&netfs_n_rh_download);
> > > +	if (iov_iter_count(&subreq->io_iter) != subreq->len - subreq->transferred)
> > > +		pr_warn("R=%08x[%u] ITER PRE-MISMATCH %zx != %zx-%zx %lx\n",
> > > +			rreq->debug_id, subreq->debug_index,
> > > +			iov_iter_count(&subreq->io_iter), subreq->len,
> > > +			subreq->transferred, subreq->flags);
> > 
> > pr_warn is a bit alarmist, esp given the cryptic message.  Maybe demote
> > this to INFO or DEBUG?
> > 
> > Does this indicate a bug in the client or that the server is sending us
> > malformed frames?
> 
> Good question.  The network filesystem updated subreq->transferred to indicate
> it had transferred X amount of data, but the iterator had been updated to
> indicate Y amount of data was transferred.  They really ought to match as it
> may otherwise indicate an underrun (and potential leakage of old data).
> Overruns are less of a problem since the iterator would have to 'go negative'
> as it were.
> 
> However, it might be better just to leave io_iter unchecked since we end up
> resetting it anyway each time we reinvoke the ->issue_read() op.  It's always
> possible that it will get copied and a different iterator get passed to the
> network layer or cache fs - and so the change to the iterator then has to be
> manually propagated just to avoid the warning.

Actually, it's more complicated than that.  It's an assertion that netfslib is
doing the right prep.  This assertion is checked both when we initially make a
request (in which case it definitely shouldn't fire) and when we perform a
resubmission on partial/complete read failure when we need to carefully
revalidate the numbers to make sure we don't end up with holes or wrinkles in
the buffer.

Anyway, it shouldn't happen - but if it does, it probably presages data
corruption.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

