Return-Path: <linux-cachefs+bncBDLIXLMFVAERBYOSQ2WAMGQEFM2PPCA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DA28189F9
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 15:32:02 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58d0c968357sf5063030eaf.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 06:32:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702996321; cv=pass;
        d=google.com; s=arc-20160816;
        b=cuuTCzzDtM6zdJUJ4HRImkEFC2K+IMFTzB8aZ0tr9Kfj3M2c1FbfOKjUb+U5OcWS2V
         ToPOx5DN1hY+aouDwlrBl6NFVd3+sjLULNgc4GO2wxh0aVNnCsQ0co3del+xgQGc4xj1
         WZjVWiaqKUX40Pw84L3Z4g9WjEX42ZZ4nzhxd7WL/g5q8u8GK+2qvrGFNKfLJdCfMwtP
         zIe2YdXn6FqMapo0wSoH4rJIU+rthHnzH2tt2JODvxqFlBtP5ysFGDiG90WiAwSTYhDb
         3/L4bUEp/rfS4/Nhyui+OwLtB7Gr4rHbAXRjzwJGLs1hegeuOHaGsTF+ranqKCWROOjr
         xNmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=xLbJSRjm9giH8J4OTOfTM+IukuOFdxPpcWdAfp96mwE=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=0CslEO8miH51PrpWjl/NNFKbHFNPTb9BLfdcV/6UOWe3r+DYEWyAnId8Y3IcwNT8QL
         h3wLdrLDB0g6hY1iHcVUQj1qqYG4Zm9vG23R5qizExaOU4/5bMcO0d+Oa7PAbPHDoBcL
         eVcDOSXSstbo2vGNrzprQOFYudZQgoGLZvJ0V9AHEJAGLan65N95pKR550OURNQFBYHF
         7KowD/8BQdi70XIYOZsJGzYa31bj2uBgRCaSlKhzn58j+ZyUU1M+ICbzLpZrqky/juCH
         pYmhXsjYxkSts8rQnw5WDYmD/B5X7A0cafxkG6UO6GSP6CFgXXGp1yaqQhMU7Jc+ouyt
         clnw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996321; x=1703601121;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLbJSRjm9giH8J4OTOfTM+IukuOFdxPpcWdAfp96mwE=;
        b=ldLSuJFYhY8RO7LIw5YaOBu054FGgaXepTPsIIfJa7bUO3qtQ6xSGtFW/JAGWS2L1P
         8RB+n0rnigyJWsxFinjjGSdM/7jHh/0NUmKHLKGQy0ZEBTuQwPCvZ7z1l7G/7pbbPvlw
         hqMN/AbI9nlD7Hy50YdmR0a2T12yIXs3hSnqytERrIlF6IcBCIsqeNklWWUdX6NXOrjr
         3WVmZOk5hv37+3IhL47uAtmrCPOHL3B2hqlDoJ/uYGFJg6aYhNq/bnX9TGd1+KIN2lTy
         PwogPB+OBvU7oCN8hPeVWOa10cTDzAeTY4bP4EqkYS9tjIdwwWKN4IeqkUjzFVxGERv1
         B3Mw==
X-Gm-Message-State: AOJu0YzxLBlyJFR4hgmAcuJyP1GTxjiYQ7ftiEg7KQ8CqhCYncICoEU1
	Es/LYq/PTOJxmSAaNbxIOcBF0Q==
X-Google-Smtp-Source: AGHT+IEk+Bmqax+3yrAjFwAHiypjkVQul736+qlDQbWMRSrM4Y5yPLt41nRujpCc9kDudFoPMkTQ3A==
X-Received: by 2002:a05:6358:ee8f:b0:170:2421:fa03 with SMTP id il15-20020a056358ee8f00b001702421fa03mr17093943rwb.41.1702996321409;
        Tue, 19 Dec 2023 06:32:01 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:181b:b0:423:b70e:f8f1 with SMTP id
 t27-20020a05622a181b00b00423b70ef8f1ls6126608qtc.0.-pod-prod-05-us; Tue, 19
 Dec 2023 06:32:00 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:77d:93b3:c909 with SMTP id n6-20020a05620a294600b0077d93b3c909mr21041411qkp.0.1702996320623;
        Tue, 19 Dec 2023 06:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702996320; cv=none;
        d=google.com; s=arc-20160816;
        b=Lk7VBMlTjX6LTFIhZrIAF4Ko79CSjR1RoRG+50JLnCJhR4KHut/fYA8ImyXb3yKTnn
         R5gGKv4QaYyfSzPuvISm5DY7ByiGKm0rR92ttuZ6jcArITAbjmtJ+HAp5afatvMxJECc
         HGHt/h9V41dCq4GZWrMtOMdggIOToCFTA3C/f7c3Mtt17zRJ9Df4kGjpF2xnWkH/of+n
         66LG97NfzxggRn/WMfCyH04pcNeX7FYHJq97/uDYb4bSzfPtF1AsKDvki6Oohdrk8cnt
         C7FMiG8rGPkTclF9cgpVJBgozqNgCvoXbPT8ZL2Co/Foj92PJkvI+aFmVbYkJUyBHoLf
         HB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=20WReb2dk9QmU4imv5ACWfKXjTyLmauIf959iO4NXIQ=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=O+Fwccq4HnSNcvF3NubXeoHKtdgFpfnJamWN5MfK8Ncs6u9Q3RtRpoOs9sOZalajN1
         atS0KXJcmcz5Mu3b0EFZ1eCWE1Z6GDS3ITEUOjlMrXIF8iPT0QNZRAxvcgwaoR7bdqXD
         z/fDOGUR/2lMTRVcrpU/TA+Z/FqFrUo4dJ+SKCWBfRA0v4HMG/g7/8kWMF7i5t1SS+XI
         DZQ0dlu7f0sc58GpnzlwEL1Yt4S5Tg7kEnOPzmKf0HXHaYdLVrB/SeY034ujc0YDssGu
         AaiQFqzPQoRgrpUx4+PN46BoBKYZRcJt2j5Vq74rnJcf593WQVN/yTqfT7dm9unPOLCH
         +S0A==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bk35-20020a05620a1a2300b007726499db83si28307066qkb.229.2023.12.19.06.32.00
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-SMJ5WfVnMCu4CUEVajV4Vw-1; Tue,
 19 Dec 2023 09:31:57 -0500
X-MC-Unique: SMJ5WfVnMCu4CUEVajV4Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE7438562D1
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 14:31:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A8CD92166B34; Tue, 19 Dec 2023 14:31:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A72882166B31;
	Tue, 19 Dec 2023 14:31:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <367107fa03540f7ddd2e8de51c751348bd7eb42c.camel@kernel.org>
References: <367107fa03540f7ddd2e8de51c751348bd7eb42c.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-13-dhowells@redhat.com>
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
Subject: Re: [PATCH v4 12/39] netfs: Add iov_iters to (sub)requests to describe various buffers
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 14:31:53 +0000
Message-ID: <488523.1702996313@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <488522.1702996313.1@warthog.procyon.org.uk>
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

Jeff Layton <jlayton@kernel.org> wrote:

> > @@ -408,6 +417,10 @@ int netfs_write_begin(struct netfs_inode *ctx,
> >  	ractl._nr_pages = folio_nr_pages(folio);
> >  	netfs_rreq_expand(rreq, &ractl);
> >  
> > +	/* Set up the output buffer */
> > +	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
> > +			rreq->start, rreq->len);
> 
> Should the above be ITER_SOURCE ?

No - we're in ->write_begin() and are prefetching.  If you look in the code,
there's a netfs_begin_read() call a few lines below.  The output buffer for
the read is the page we're going to write into.

Note that netfs_write_begin() should be considered deprecated as the whole
perform_write thing will get replaced.

> > @@ -88,6 +78,11 @@ static void netfs_read_from_server(struct netfs_io_request *rreq,
> >  				   struct netfs_io_subrequest *subreq)
> >  {
> >  	netfs_stat(&netfs_n_rh_download);
> > +	if (iov_iter_count(&subreq->io_iter) != subreq->len - subreq->transferred)
> > +		pr_warn("R=%08x[%u] ITER PRE-MISMATCH %zx != %zx-%zx %lx\n",
> > +			rreq->debug_id, subreq->debug_index,
> > +			iov_iter_count(&subreq->io_iter), subreq->len,
> > +			subreq->transferred, subreq->flags);
> 
> pr_warn is a bit alarmist, esp given the cryptic message.  Maybe demote
> this to INFO or DEBUG?
> 
> Does this indicate a bug in the client or that the server is sending us
> malformed frames?

Good question.  The network filesystem updated subreq->transferred to indicate
it had transferred X amount of data, but the iterator had been updated to
indicate Y amount of data was transferred.  They really ought to match as it
may otherwise indicate an underrun (and potential leakage of old data).
Overruns are less of a problem since the iterator would have to 'go negative'
as it were.

However, it might be better just to leave io_iter unchecked since we end up
resetting it anyway each time we reinvoke the ->issue_read() op.  It's always
possible that it will get copied and a different iterator get passed to the
network layer or cache fs - and so the change to the iterator then has to be
manually propagated just to avoid the warning.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

